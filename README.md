# 20190419

Test code for live on Fri 19 Apr. 2019  (WIP)

### Requirements

Xcode Command Line Tools

### Build & Run example

How to build ./Metal/Metal

##### Build MSL

    $ cd ./Metal
    $ xcrun -sdk macosx metal -c blue.metal -o blue.air; xcrun -sdk macosx metallib blue.air -o blue.metallib
	
##### Build Command Line Tool & Run

    $ cd ./Metal
    $ xcrun clang++ -ObjC++ -lc++ -fobjc-arc -O3 -std=c++17 -Wc++17-extensions -framework Cocoa -framework Metal -framework Quartz ./MetalView.mm ./Metal.mm -o Metal
    $ ./Metal

#### Linking libjpeg-turbo

    -I../libs/libjpeg-turbo -L../libs/libjpeg-turbo -lturbojpeg

### See also

[rdm-jpg](https://github.com/mizt/rdm-jpg) Extra JPEG File Format.   
[map/write.mm](https://github.com/mizt/map/blob/master/write.mm) Bake a Map data.    
[METAL-NYUMON](https://note.mu/mizt/n/n1a3f0d2a555b)（CodeRunnerでビルドする方法）

### 20190318

OSCのライブラリを自作のものから[TinyOSC](https://github.com/mhroth/tinyosc)に変更
