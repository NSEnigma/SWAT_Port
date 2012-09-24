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
  SET _keep=
  if x!_result! == x.xml set _keep=1
  if x!_result! == xgers set _keep=1
  if x!_result! == xects set _keep=1
  if x!_result! == xents set _keep=1
  if x!_result! == x.txt set _keep=1
  if x!_result! == xions set _keep=1
  if NOT defined _keep (
    ECHO Resetting %%f...
    @call git reset HEAD %%f
    @call git checkout -- %%f
  )
)
call git status
cd %pwd%
echo Done!
