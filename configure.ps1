if ($IsWindows) {
    $generator = "Visual Studio 17 2022"
} else {
    $generator = "Ninja Multi-Config"
}

$build_path = "build"
$build_path_ext = "./ext/math_lib/build"

if (!(Test-Path -Path $build_path_ext)) {
    cmake -G $generator -B $build_path_ext -S ./ext/math_lib
}
cmake --build $build_path_ext --target install --config Debug
cmake --build $build_path_ext --target install --config Release


if (!(Test-Path -Path $build_path)) {
    cmake -G $generator -B $build_path
} else {
    cmake -B $build_path
}
