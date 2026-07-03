@echo off
setlocal

for %%I in ("%~dp0..") do set "ROOT=%%~fI"
set "PORT=8793"
set "URL=http://127.0.0.1:%PORT%/05.%%20%%EA%%B0%%80%%EA%%B2%%A9%%EB%%B9%%84%%EA%%B5%%90/zone_google_maps_builder_v1.0.html"
set "BUNDLED_PY=C:\Users\akstn\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe"

if exist "%BUNDLED_PY%" (
  set "PYTHON=%BUNDLED_PY%"
) else (
  where python >nul 2>nul
  if %ERRORLEVEL% EQU 0 (
    set "PYTHON=python"
  ) else (
    where py >nul 2>nul
    if %ERRORLEVEL% EQU 0 (
      set "PYTHON=py"
    ) else (
      echo Python was not found.
      echo Please install Python or run this from the Codex environment.
      pause
      exit /b 1
    )
  )
)

echo Starting local server for GroundK Zone Builder...
echo URL: %URL%
echo.
echo A server window will stay open while you use the builder.
echo If the browser says it cannot connect, wait 2 seconds and refresh.
echo.

cd /d "%ROOT%"
start "GroundK Zone Builder Server - keep open" "%PYTHON%" -m http.server %PORT% --bind 127.0.0.1

powershell -NoProfile -ExecutionPolicy Bypass -Command "$ok=$false; for($i=0;$i -lt 20;$i++){ try { $r=Invoke-WebRequest -UseBasicParsing -Uri 'http://127.0.0.1:%PORT%/' -TimeoutSec 1; if($r.StatusCode -ge 200){ $ok=$true; break } } catch { Start-Sleep -Milliseconds 500 } }; if($ok){ exit 0 } else { exit 1 }"
if %ERRORLEVEL% NEQ 0 (
  echo.
  echo Local server did not respond on http://127.0.0.1:%PORT%/
  echo Try closing any existing Python/http.server windows, then run this file again.
  echo.
  pause
  exit /b 1
)

start "" "%URL%"

endlocal
