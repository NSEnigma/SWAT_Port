echo off
setlocal ENABLEDELAYEDEXPANSION
::for /f %%f in ('dir /s /b .') do call git update-index -q --no-assume-unchanged %%f
echo %cd%
set pwd=%cd%
cd ComponentList.SC2Map
echo %cd%
for /R %%f in (*) do (
  SET _ext=%%f
  SET _result=!_ext:~-4!
  if NOT x!_result! == x.xml ( 
    if NOT x!_result! == x.txt ( 
      if NOT x!_result! == xgers (
        if NOT x!_result! == xects (
          @ECHO Resetting %%f...
          @call git reset HEAD %%f
          @call git checkout -- %%f
        )
      )
    )
  )  
)
call git status
cd %pwd%
echo Done!
