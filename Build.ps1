$BuildType = "Release"

$CMakeArgs = @(
"-S ./",
"-G",
"`"Ninja`"",
"-DCMAKE_BUILD_TYPE=$BuildType",
"-DCMAKE_C_FLAGS=-m32 -DCMAKE_CXX_FLAGS=-m32"
" -B `"out`""
)

Start-Process -FilePath "cmake.exe" -ArgumentList $CMakeArgs -Wait -NoNewWindow

Write-Host "Build with Ninja"

$CMakeArgs = @(
"--build",
"`"out`"",
"--config $BuildType"
)

Start-Process -FilePath "cmake.exe" -ArgumentList $CMakeArgs -Wait -NoNewWindow

Get-ChildItem "out" -Recurse | Where{$_.Name -Match "\.obj|\.lib"} | Remove-Item