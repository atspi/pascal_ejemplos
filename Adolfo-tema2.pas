program MRUV;
 
{ Solución tema 2 del primer parcial de computación 5/5/2021
* Autor Spinelli Adolfo Tomás
* Construido como referencia de corrección}

var
	t1,t2,x1,x2,acel,vel0, VM, VMMax, SumaVM, PromVM, acelREF, vel0REF : real;
	contVM : Integer;
	isMRUV : Boolean;
	
BEGIN
	SumaVM:=0; {Inicializo en 0 por que es un totalizador (0 neutro de suma)}
	PromVM:=0; {Inicializo en 0 por que es un totalizador (0 neutro de suma)}
	contVm:=0; {Inicializo en 0 por que es un totalizador (0 neutro de suma)}
	isMRUV:=true; {supongo que es MRUV, se usa para verificar la pertenencia de la dupla al MRUV}
	{para estimar vel0REF y acelREF, es necesario contar con las dos primeras duplas y calcular 
	* en función de la ecuación cuadratica, no se puede asumir una dupla inicial (0,0)}
	writeln('Ingrese la primer dupla de tiempo y posición : ');
	readln(t1, x1); {ingreso primer dupla}
	writeln('Ingrese la segunda dupla de tiempo y posición : ');
	readln(t2, x2); {ingreso segunda dupla}
	if (t1=0) or (t2=0) THEN
	   t1:=0 {Se termina el programa}
	else 
	   begin
	    {Calculo Vel0 y Acel de referencia}
		vel0REF:=((x1/t1)-(1/t2)*((t1*x2-x1*t2)/(t2-t1)));
		acelREF:=2*((t1*x2-t2*x1)/(t1*t2*(t2-t1)));
		VMmax:=(x2-x1)/(t2-t1); {inicializo el VMmax con la primer VM}
		sumaVM:=SumaVM+VMmax; {inicializa totalizador con VMmax (primer VM)}
		contVM:=1; {inicializo en 1 contador}
		t1:=t2;
		x1:=x2; {para ingresar el siguiente en t2 x2}
	   end;
	while t1<>0 do {termino cuando se ingresa un t1=0}
	  begin
	   	 Writeln('Ingrese la siguiente dupla de tiempo y posición : ');
	   	 readln(t2,x2); {ingresa la siguiente dupla (t2,x2)}
	   	 if t2<>0 then { si t2 = 0 termina el ciclo pues al final del if, pongo ese valor en t1}
	   	   begin
			vel0:=((x1/t1)-(1/t2)*((t1*x2-x1*t2)/(t2-t1)));
			acel:=2*((t1*x2-t2*x1)/(t1*t2*(t2-t1)));
			VM:=(x2-x1)/(t2-t1); {velocidad media entre x1 y x2}
			if VM>0 then {solo las VM positivas para el Maximo}
			   if VM>VMmax then {cambio el máximo si VM es mayor que el último máximo}
			     VMmax:=VM;
			sumaVM:=SumaVM+VM; {suma de todas las VM}
			contVM:=contVM+1; {cuento todos los VM para el promedio}
			isMRUV:=(vel0=vel0REF) and (acel=acelREF); { Verifíco si es MRUV ( deben tener la misma velocidad inicial y aceleración}
		   end;
		 t1:=t2; {la dupla (t2, x2) pasa a ser (t1, x1), para poder ingresar una nueva dupla (t2,x2)}
	   	 x1:=x2;
	end;
	PromVM:=SumaVM/contVM;  {Promedio de VM}
	if isMRUV Then
	   writeln('Pertenecen a un MRUV con velocidad inicial : ',Vel0:10:2,' y aceleración : ',acel:10:2);
	writeln('Velocidad Media Máxima Positiva : ',VMmax:10:2);
	writeln('Velocidad Media Promedio : ',PromVM:10:2);
END.
