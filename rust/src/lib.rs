use std::ffi::{c_char, CStr, CString};
use md5 as md_5;

#[no_mangle]
pub extern "C" fn md5(input: *mut c_char) -> *mut c_char {
    unsafe {
        let c_str = CStr::from_ptr(input);
        let str_slice = c_str.to_str().unwrap();
        let mut context = md_5::Context::new();
        context.consume(str_slice.as_bytes());
        let result = context.compute();
        let result = format!("{:x}", result);
        let c_string = CString::new(result).unwrap();
        c_string.into_raw()
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn it_works() {
        let c_string = CString::new("abc").expect("CString::new failed");
        let c_ptr = c_string.into_raw();
        let result = unsafe{
            md5(c_ptr)
        };
        let result = {
            CStr::from_ptr(result).to_str().unwrap()
        };
        assert_eq!(result, "900150983cd24fb0d6963f7d28e17f72");
    }
}
