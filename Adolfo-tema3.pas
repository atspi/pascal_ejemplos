program MRU;
 
{ Solución tema 3 del primer parcial de computación 5/5/2021
* Autor Spinelli Adolfo Tomás
* Construido como referencia de corrección}

var
    t1,t2,x1,x2, xprueba,tiempoinicial, vel0, x0REF, vel0REF, va, vb, minVM : real;
	cantMaxconsecutivas, cantidadduplas, cantconsecutivas, cantintvavb : Integer;
		
BEGIN
    writeln('Íngrese los valores para va y vb');
    Readln(va,vb);
	writeln('Ingrese la primer dupla de tiempo y posición : ');
	readln(t1, x1); {ingreso primer dupla}
	writeln('Ingrese la segund dupla dupla de tiempo y posición : ');
	readln(t2, x2); {ingreso segunda dupla}
	cantintvavb:=0; {contador de vm en el intervalo va, vb}
	if (t2<>0) and (t1<>0) THEN {si t1=0 o t2=0, el programa termina}
	   begin
	    {Calculo vel0 y x0 de referencia}
		vel0REF:= (x2-x1)/(t2-t1);
		x0REF:=x1-(t1*(2-x1)/(t2-t1));
		minVM:=abs(vel0Ref); {inicializo el minVM con el primer VM}
		if (vel0REF>=va) and (vel0REF<=vb) then {verifico de vel0REF esta entre va y vb, si lo está lo cuento} 
		   cantintvavb:=cantintvavb+1;
		cantidadduplas:=2; {inicializo la cantidad de duplas en 2 pues ya ingrese 2}
		cantMaxconsecutivas:=0;   {Inicializo el contador en 0}
		cantconsecutivas:=2; {inicializo la cantidad de consecutivas en 2 pues 
		las primeras duplas me dan el v0 y x0 y asumo que pertenece al MRU }
		tiempoinicial:=t1; {guardo el tiempo de la primer dupla para saber cuando se da la referencia a x0REF}
		t1:=t2;
		x1:=x2;{la dupla (t2, x2) pasa a ser (t1, x1), para poder ingresar una nueva dupla (t2,x2)}
	   end
	else 
	    t1:=0; {para asegurar que no entra en el ciclo, si el programa termina}
	while t1<>0 do {termino cuando se ingresa un t1=0}
	  begin
	   	 Writeln('Ingrese la siguiente dupla de tiempo y posición : ');
	   	 readln(t2,x2); {ingresa la siguiente dupla (t2,x2)}
	   	 if t2<>0 then { si t2 = 0 termina el ciclo pues al final del if, pongo ese valor en t1}
	   	   begin
			vel0:= (x2-x1)/(t2-t1); {calculo vel0 con la nueva dupla y la inmediata anterior}
			xprueba:=X0REf+vel0*(t2-tiempoinicial); {resto a t2 el tiempoinicial para tomar en cuenta X0REF}
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
