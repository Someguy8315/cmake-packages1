if ($IsWindows) {
    $generator = "Visual Studio 17 2022"
} else {
    $generator = "Ninja Multi-Config"
}

$build_path = "./ext/math_lib/build"

if (!(Test-Path -Path $build_path)) {
    cmake -G $generator -B $build_path -S ./ext/math_lib
}

cmake --build $build_path --target install --config Debug
cmake --build $build_path --target install --config Release
