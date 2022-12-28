if ($IsWindows) {
    $generator = "Visual Studio 17 2022"
} else {
    $generator = "Ninja Multi-Config"
}

$build_path = "build"

if (!(Test-Path -Path $build_path)) {
    cmake -G $generator -B $build_path
} else {
    cmake -B $build_path
}
