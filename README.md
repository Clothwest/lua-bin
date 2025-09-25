# lua-bin

This repository is used to build lua binaries for Windows.

## Code

In `lua.c`, I added a `WinMain` function to support `wlua` on Windows:

```C
int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow) {
	return main(__argc, __argv);
}
```

## Build

> Open the solution in Visual Studio.
> For each of the projects `lua`, `luac`, and `wlua`, right-click and select **Build** to compile the binaries.
