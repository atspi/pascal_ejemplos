program MRU;
 
{ Solución tema 3 del primer parcial de computación 5/5/2021
* Autor Spinelli Adolfo Tomás
* Construido como referencia de corrección}

var
    t1,t2,x1,x2, xprueba, vel0, x0REF, vel0REF, va, vb, minVM : real;
	cantMaxconsecutivas, cantidadduplas, cantconsecutivas, cantintvavb : Integer;
		
BEGIN
    t1:=0;
    x1:=0; {dupla de arranque del MRU cuando (t y x son cero) para calcular vel0REF y x0REF}
    writeln('Íngrese los valores para va y vb');
    Readln(va,vb);
	writeln('Ingrese la primer dupla de tiempo y posición : ');
	readln(t2, x2); {ingreso primer dupla}
	cantintvavb:=0; {contador de vm en el intervalo va, vb}
	if (t2<>0) THEN {si t2=0, el programa termina}
	   begin
	    {Calculo vel0 y x0 de referencia}
		vel0REF:= (x2-x1)/(t2-t1);
		x0REF:=x1-(t1*(2-x1)/(t2-t1));
		minVM:=abs(vel0Ref); {inicializo el minVM con el primer VM}
	   end;
    cantidadduplas:=1; {inicializo la cantidad de duplas en 1 pues ya ingrese 1}
    cantMaxconsecutivas:=0;   {Inicializo el contador en 0}
    cantconsecutivas:=1; {inicializo la cantidad de consecutivas en 1 pues 
    la primera dupla me da el v0 y x0 y asumo que pertenece al MRU }
    t1:=t2;
    x1:=x2;{la dupla (t2, x2) pasa a ser (t1, x1), para poder ingresar una nueva dupla (t2,x2)}
	while t1<>0 do {termino cuando se ingresa un t1=0}
	  begin
	   	 Writeln('Ingrese la siguiente dupla de tiempo y posición : ');
	   	 readln(t2,x2); {ingresa la siguiente dupla (t2,x2)}
	   	 if t2<>0 then { si t2 = 0 termina el ciclo pues al final del if, pongo ese valor en t1}
	   	   begin
			vel0:= (x2-x1)/(t2-t1); {calculo vel0 con la nueva dupla y la inmediata anterior}
			xprueba:=x0REF + vel0*t2; {calculo la posición con la ecuación del MRU para vel0}
			if minVM>abs(vel0) then {verifico si el valor absoluto de vel0 es menos que el minVM en cuyo 
			caso reemplazo minVM por vel0} 
			   minVM:=abs(vel0);
			if (vel0>=va) and (vel0<=vb) then {verifico de vel0 esta entre va y vb, si lo está lo cuento} 
		      cantintvavb:=cantintvavb+1;
            cantidadduplas:=cantidadduplas+1; {cuento las duplas ingresadas}
			if (vel0REF=vel0) and (x2=xprueba) then {verifico si la dupla pertenece a MRU de ser asi incremento 
			cantconsecutivas, pues sigue la cadena} 
			   cantconsecutivas:=cantconsecutivas+1
		    else
		       begin
				  {si no pertenece al MRU chequeo si la cadena es un nuevo máximo, en cuyo caso reemplazo
				  * cantMaxconsecutivas y pongo en 0 cantconsecutivas, para contar la proxima cadena desde 0}
				 if cantMaxconsecutivas<cantconsecutivas then
				    cantMaxconsecutivas:=cantconsecutivas;
                 cantconsecutivas:=0;
			   end;
		   end;
	     t1:=t2; {la dupla (t2, x2) pasa a ser (t1, x1), para poder ingresar una nueva dupla (t2,x2)}
	   	 x1:=x2;
	end;
	{ si la cantidad de duplas ingresadas es igual a la cantconsecutivas, todas las duplas pertenecen al MRUV,
	* en caso contrario esto no ocurre}
	if cantidadduplas=cantconsecutivas then
	   writeln('Las duplas corresponden a un MRU con x0REF : ', x0REF:10:2,' y v0 : ',vel0REF:10:2)
	  else
	   writeln('Las duplas no pertenecen a un MRU, siendo la mayor cadena de duplas que si lo hacen de : ',cantMaxconsecutivas:10, ' duplas' );
	writeln('Velocidad Media Minima  absoluta: ',minVM:10:2,' cantidad en el intervalo va = ',va:10:2,' y vb = ',vb:10:2,' : ',cantintvavb:10);
end.
