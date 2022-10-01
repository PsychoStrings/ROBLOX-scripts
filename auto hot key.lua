--Script by LaTehuana

#MaxThreadsPerHotkey 2
F1::
Toggle := !Toggle
While (toggle)
{
    Send, {r}
    Sleep, 100
}
return
