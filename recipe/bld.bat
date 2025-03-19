setlocal EnableDelayedExpansion

:: Make a build folder and change to it.
mkdir build
cd build

:: Configure using the CMakeFiles
cmake ^
	"%SRC_DIR%" ^
	-G "Ninja" ^
	-DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%" ^
	-DCMAKE_PREFIX_PATH:PATH="%LIBRARY_PREFIX%" ^
	-DCMAKE_BUILD_TYPE:STRING=Release
if errorlevel 1 exit 1

:: Build!
cmake --build . --verbose --parallel "%CPU_COUNT%"
if errorlevel 1 exit 1

:: Install!
cmake --build . --verbose --parallel "%CPU_COUNT%" --target install
if errorlevel 1 exit 1
