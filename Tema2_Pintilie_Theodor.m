%Numar de ordine: 23
P = 40; %Perioada semnalului
f = 1 / P;
t = -3 * P:0.4:3*P;
D=23;   %pulsul semnalului in functie de numarul echipei
duty = 22.5;      %factorul de umplere duty=D/40*100
N = 50;       %numarul de coeficienti
w0 = 2 * pi / P; 
x_dr = square(w0*t,duty);        %semnalul dreptunghiular
f=@(t)square(w0*t,duty);
CC= 1 /P * integral(f,0,P);
Ck=zeros(1,N);
Ak=zeros(1,N);
x_2=0;
for (k=1:1:N)
   f=@(t)square(w0*t,duty).exp(-w0*t*1j(k-25));
   Ck(k)=1/P*integral(f,0,P);             %coeficientii SFC
   Ak(k+1)=2*abs(Ck(k));
   x_2=x_2+Ck(k)exp(w0*t*1j(k-25));
end
figure(1);
plot(t,x_2,t,x_dr);
figure(2)
Ak(26)=abs(CC);
Ak(1)=Ak(51);                    %Amplitudinea Ak
stem([0:N],Ak);                     %se afiseaza spectrul de valori

%D este egal cu numarul de ordine 
%Semnal dreptunghiular periodic care poate fi aproximat printr-o suma
%infinita de sinusuri si cosinusuri de frecvente diferite conform
%Seriei Fourier.
%Coeficientii seriei reprezinta spectrul semnalului.
%Semnalul reconstruit are aproximativ aceeasi forma ca
%semnalul original. Cu cat creste numarul coeficientilor seriei Fourier,
%diferenta va fi din ce in ce mai mica intre semnalul reconstituit si cel 
%original.
