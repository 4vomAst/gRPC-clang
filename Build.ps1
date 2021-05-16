$CMakeArgs = @(
"-S ./",
"-G",
"`"Ninja`"",
"-DCMAKE_BUILD_TYPE=RelWithDebInfo",
"-DCMAKE_C_FLAGS=-m32 -DCMAKE_CXX_FLAGS=-m32"
" -B `"out/win/x86`""
)

Start-Process -FilePath "cmake.exe" -ArgumentList $CMakeArgs -Wait -NoNewWindow

Write-Host "Build with Ninja"

$CMakeArgs = @(
"--build",
"`"out/win/x86`"",
"--config RelWithDebInfo"
)

Start-Process -FilePath "cmake.exe" -ArgumentList $CMakeArgs -Wait -NoNewWindow

Remove-Item -Recurse -Force "out/win/x86"