    function x=Thomas(d,s,y)
	
    n=length(d);
    
 	%Construim vectorii pentru diagonala superioara si cea inferioara
 	%astfel incat sa aibe aceeasi dimensiune.
    a=[0 s];
    c=[s 0];
 
	%Facem operatiile la limita.
    c(1)=c(1)/d(1); 
	y(1)=y(1)/d(1);   
 	
	%Folosind formulele de calcul al necunoscutelor,calculam coefiecientii
	%pe caz general.
    for i=2:n-1
    	temp=d(i)-a(i)*c(i-1);
    	c(i)=c(i)/temp;
    	y(i)=(y(i)-a(i)*y(i-1))/temp;
    end
    y(n)=(y(n)-a(n)*y(n-1))/(d(n)-a(n)*c(n-1));
 
	%Calculam necunoscutele cautate prin substitutie,in sens invers.
    x(n)=y(n);
	for i=n-1:-1:1
    	x(i)=y(i)-c(i)*x(i+1);

    end
