# 别名
function .. {
    $parent = Split-Path -Parent $pwd
    Set-Location $parent
  }
  
  function ... {
    $parent = Split-Path -Parent $pwd
    $parent = Split-Path -Parent $parent
    Set-Location $parent
  }
  
  function .... {
    $parent = Split-Path -Parent $pwd
    $parent = Split-Path -Parent $parent
    $parent = Split-Path -Parent $parent
    Set-Location $parent
  }
  
  function ~ {
    Set-Location $HOME
  }
  
  function c {
    Set-Location C:\
  }
  
  function d {
    Set-Location D:\
  }
  
  function e {
    Set-Location E:\
  }
  
  function f {
    Set-Location F:\
  }
  
  
  function config {
    code $PROFILE
  }
  
  function touch {
    Write-Output $null | Out-File -Encoding utf8 -FilePath $args[0]
  }
  
  # 删除文件到回收站 https://github.com/sindresorhus/trash-cli
  function rmf {
    trash $args
  }
  
  # ip 信息查询 https://github.com/sukkaw/nali-cli
  function ipdata {
    nali $args
  }
  
  # ip 信息查询
  function ip {
    $ip = $args[0]
    if ($null -eq $ip) {
      $ip = (Invoke-WebRequest -Uri 'http://ip-api.com/json/?lang=zh-CN').Content
    } else {
      $ip = (Invoke-WebRequest -Uri "http://ip-api.com/json/$($ip)?lang=zh-CN").Content
    }
    $ip | ConvertFrom-Json | Format-List -Property *
  }
  
  function vcpkg {
    D:\code\vcpkg\vcpkg.exe $args
  }
  
  # 设置代理
  function proxy {
    $Env:http_proxy="http://127.0.0.1:7890";
    $Env:https_proxy="http://127.0.0.1:7890"
  }
  
  # 取消代理
  function unproxy {
    $Env:http_proxy="";
    $Env:https_proxy=""
  }
  
  # git的自动补全
  Import-Module posh-git
  
  # 自动补全
  # powershell配置自动补全：https://zhuanlan.zhihu.com/p/137251716
  # https://github.com/PowerShell/PSReadLine
  
  # 设置预测文本来源为历史记录
  Set-PSReadLineOption -PredictionSource History
  
  # 设置 Tab 键补全
  Set-PSReadlineKeyHandler -Key Tab -Function Complete
  # 设置 Ctrl+d 为菜单补全和 Intellisense
  Set-PSReadLineKeyHandler -Key "Ctrl+d" -Function MenuComplete
  # 设置向上键为后向搜索历史记录
  Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
  # 设置向下键为前向搜索历史纪录
  Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
  # 设置 Ctrl+z 为撤销
  Set-PSReadLineKeyHandler -Key "Ctrl+z" -Function Undo
  
  # 自动跳转到目录
  Import-Module ZLocation
  
  Import-Module 'D:\code\vcpkg\scripts\posh-vcpkg'
  