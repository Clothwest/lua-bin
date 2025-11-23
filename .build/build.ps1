$premake5 = ".\.build\premake5\premake5.exe"
$genfile = ".\.build\premake5.lua"
& $premake5 --file=$genfile vs2022

$vswhere = "$env:ProgramFiles (x86)\Microsoft Visual Studio\Installer\vswhere.exe"
$msbuildlist = & $vswhere -version "[17.0, 18.0)" -find MSBuild\**\MSBuild.exe

$msbuild = $msbuildlist | Where-Object { $_ -like "*64*" } | Select-Object -First 1

if (-not $msbuild) {
	Write-Host "MSBuild not found." -ForegroundColor Red
	exit 1
}

Write-Host "Using MSBuild: $msbuild" -ForegroundColor Green

$solution = ".\.build\.vs-workspace\lua-bin.sln"
$configuration = "Release"
$platform = "x64"
$target = "Build"

& $msbuild $solution /p:Configuration=$configuration /p:Platform=$platform /t:$target /m

$exitcode = $LASTEXITCODE

if ($exitcode -ne 0) {
	Write-Host "Build FAILED with code $exitcode" -ForegroundColor Red
	exit $exitcode
}

Write-Host "Build SUCCEEDED" -ForegroundColor Green
