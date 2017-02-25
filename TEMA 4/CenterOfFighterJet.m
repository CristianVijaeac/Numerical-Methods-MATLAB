function CenterOfFighterJet(path)
Volume=0;
Mass=0;
MX=0;
MY=0;
CMX=0;
CMY=0;
CMZ=0;
for i=0:6       %deschidem fiecare fisier pentru citire
    A=dlmread(strcat(path,sprintf('date%d.in',i)));  %memoram coordonatele intr o matrice
    x=A(:,1);   %extragem coordonatele x
    y=A(:,2);   %extragem coordonatele y
    z=A(:,3);   %extragem coordonatele z
    x=x';
    y=y';
    z=z';
    if i==0
        aux=x;  %memoram coordonoatele varfului avionului necesare pentru centrul de masa
        auy=y;
    end
    auz(i+1)=z(1);  %memoram z-urile tuturor suprafetelor
    I(i+1)=Trapez(x,y);     %calculam ariile suprafetelor utilizand metoda trapezelor
    J(i+1)=Simpson(x,y);    %calculam ariile suprafetelor utilizand metoda Simpson
end

C=dlmread(strcat(path,'contur.in'));     %citim coordonatele conturului avionului
x=C(:,1);       %citim coordonatele x
y=C(:,2);       %citim coordonatele y
[x0,y0]=CentroidOfSurface(x,y);     %functie ce calculeaza centroidul avionului

for i=1:length(auz)-1
    V(i)=VolumeOfPlane(I(i),I(i+1),auz(i),auz(i+1));    %functie ce calculeaza volumul dintre 2 suprafete
    Volume=Volume+V(i);     %suma tuturor volumelor de mai sus reprezinta volumul avionului
end
Volume=abs(Volume);
   
ro=dlmread(strcat(path,'densitati.in')); 
ro=ro';
for i=1:length(ro)
    M(i)=MassOfPlane(ro(i),V(i));   %functia de calcul al masei corpului dintre 2 suprafete
    Mass=Mass+M(i);         %suma maselor reprezinta masa totala a avionului
end

Mass=abs(Mass);

%Scriem ceea ce am aflat pana acum

fprintf('Centroid of surface: x = %.3f y = %.3f\n',x0,y0)

fprintf('%.3f ',I);
fprintf('\n');
fprintf('%.3f ',J);
fprintf('\n');

fprintf('Volume of plane : %.3f\n',Volume);
fprintf('Mass of plane : %.3f\n',Mass);

for i=1:6
    A=dlmread(strcat(path,sprintf('date%d.in',i)));      %deschidem din nou fiecare fisier pentru citire
    x=A(:,1);       %memoram coordonatele x
    y=A(:,2);       %memoram coordonatele y
    z=A(:,3);       %memoram coordonatele z
    x=x';
    y=y';
    z=z';
    
    %Ne alegem ca punct de referinta(origine) pentru calculul centroidelor
    %suprafetelor,varful avionului.
   [MX(i),MY(i)]=CentroidOfSurface(x-aux,y-auy); %calculam coordonatele x si y ale centroidelor tuturor suprafetelor
end

%Calculam centrul de masa in raport cu varful avionului(originea).
for i=1:6
   CMX=CMX+((M(i)*(MX(i)-aux))/Mass);
   CMY=CMY+((M(i)*(MY(i)-auy))/Mass);       
   %coordonatele x si y ale centrului de masa al avionului se determina facand media ponderata a tuturor coordonatelor x si y 
   %ale centroidelor fiecarei suprafete
   CMZ=CMZ+((M(i)*(auz(i+1)-auz(1)))/Mass);
    %deoarece z este constant pentru o suprafata,coordonata z a
    %centroidului pt fiecare suprafata va fi chiar z
end

CMX=abs(CMX);
CMY=abs(CMY);
CMZ=abs(CMZ);
fprintf('Center of Mass : x=%.3f y=%.3f z=%.3f\n',CMX,CMY,CMZ);
end
    