## flutter ffi rust 静态库调用
在macos/flutter_zsign_plugin.podspec文件中添加
```text
s.vendored_libraries = "**/*.a"
```
然后在macos/Classes/FlutterZsignPlugin.swift文件中添加
```text
func 建立虚拟函数表(){
      md5(nil); //让xcode链接去找md5函数，否则静态库会报错
}
```
rust项目打包
```shell
cd rust && cargo build --release
cp target/release/libmd5.a ../macos/Classes/
```
运行
```shell
cd example
flutter run -d macos
```