clc;
clear all;
Eo=8.854*10^-12; %Permittivity of free space
Uo=4*pi*10^-7;  %permeability of free space
j=sqrt(-1); 
f=[0 100*10^3 10*10^6 900*10^6 2*10^9 6*10^9]; %frequency domain
Sigc = input('Enter the conductivity of conductor Sigc(S/m):\n');
Sig = input('Enter the conductivity of insulator Sig(S/m):\n');
Er = input('Enter the relative permittivity of insulator Er:\n');
Ucr = input('Enter the relative permeability of conductor Ucr:\n');
Ur = input('Enter the relative permeability of insulator Ur:\n');
d = input('Enter the diameter of each wire d(m):\n');
D = input('Enter the length between wire centers D(m):\n');
Resistance=Resistance_per_length(f,Sigc,Ucr,d,Uo);
Inductance=Inductance_per_length(Ur,d,D,Uo); 
Conductance=Conductance_per_length(Sig,d,D);
Capacitance=Capacitance_per_length(Er,d,D,Eo);
Zo=sqrt((Resistance+j*2*pi.*f*Inductance)./(Conductance+j*2*pi.*f*Capacitance)); % Setting the Zo array for each frequency(6,inculidng f=0)
Zopol=rect_to_polar(Zo); % Setting the polar representation array of  Zo 
Gamma=sqrt((Resistance+j*2*pi.*f*Inductance).*(Conductance+j*2*pi.*f*Capacitance)); % Setting wave propagation array for each frequency(6,inculidng f=0)
Gampol=rect_to_polar(Gamma); % Setting the polar representation array of gamma
x=1;
Y=0;
YY=0;

while x>0
r=menu('select plot','Plot_Characteristic_Impedance', 'Plot_Propagation_Constant','Plot_Wave&Input_Impedances','Plot_Whole_Waveform','exit');

      if (r == 1) %plotting Zo
          
     for counter=2:6  %Zo in polar form
              
              figure(1)
              P=compass(real(Zo(8-counter)),imag(Zo(8-counter)));
              set(P,'LineWidth',2','MarkerSize',4);
         if (counter == 2)
              text(real(Zo(counter)),imag(Zo(counter)),['  f=100kHz ',' |Zo1|=',num2str(Zopol(counter)),' arg(Zo1)= ',num2str(Zopol(counter+6))]);
         end  
         if (counter == 3)
              text(real(Zo(counter)),imag(Zo(counter)),['  f=10MHz ',' |Zo2|=',num2str(Zopol(counter)),' arg(Zo2)= ',num2str(Zopol(counter+6))]);
         end  
         if (counter == 4)
              text(real(Zo(counter)),imag(Zo(counter)),['  f=900MHz ',' |Zo3|=',num2str(Zopol(counter)),' arg(Zo3)= ',num2str(Zopol(counter+6))]);
         end  
         if (counter == 5)
              text(real(Zo(counter)),imag(Zo(counter)),['  f=2GHz ',' |Zo4|=',num2str(Zopol(counter)),' arg(Zo4)= ',num2str(Zopol(counter+6))]);
         end  
         if (counter == 6)
              text(real(Zo(counter)),imag(Zo(counter)),['  f=6GHz ',' |Zo5|=',num2str(Zopol(counter)),' arg(Zo5)= ',num2str(Zopol(counter+6))]);
         end  
              hold on;
              counter=counter+1;
          end
          
          for counter=1:6  %Real part of Zo in f domain
              figure(2)    
              stem(f(counter),real(Zo(counter)),'LineWidth',2);
              if (counter == 1)
              text(f(counter),real(Zo(counter)),['  f=0Hz',]);
              end
              if (counter == 2)
              text(f(counter),real(Zo(counter)),['  f=100kHz','  Re[Zo1]=',num2str(real(Zo(counter)))]);
              end
              if (counter == 3)
              text(f(counter),real(Zo(counter)),['  f=10MHz','  Re[Zo2]=',num2str(real(Zo(counter)))]);
              end
              if (counter == 4)
              text(f(counter),real(Zo(counter)),['  f=900MHz','  Re[Zo3]=',num2str(real(Zo(counter)))]);
              end
              if (counter == 5)
              text(f(counter),real(Zo(counter)),['  f=2GHz','  Re[Zo4]=',num2str(real(Zo(counter)))]);
              end
              if (counter == 6)
              text(f(counter),real(Zo(counter)),['  f=6GHz','  Re[Zo5]=',num2str(real(Zo(counter)))]);
              end
              hold on;
              counter=counter+1;
          end
          
          for counter=1:6   %Imaginer part of Zo in f domain
              figure(2)
              stem(f(counter),imag(Zo(counter)),'r','LineWidth',2);
              if (counter == 2)
              text(f(counter),imag(Zo(counter)),['   f=100kHz','   Im[Zo1]=',num2str(imag(Zo(counter)))]);
              end
              if (counter == 3)
              text(f(counter),imag(Zo(counter)),['   f=10MHz','   Im[Zo2]=',num2str(imag(Zo(counter)))]);
              end
              if (counter == 4)
              text(f(counter),imag(Zo(counter)),['   f=900MHz','   Im[Zo3]=',num2str(imag(Zo(counter)))]);
              end
              if (counter == 5)
              text(f(counter),imag(Zo(counter)),['   f=2GHz','   Im[Zo4]=',num2str(imag(Zo(counter)))]);
              end
              if (counter == 6)
              text(f(counter),imag(Zo(counter)),['   f=6GHz','   Im[Zo5]=',num2str(imag(Zo(counter)))]);
              end
              hold on;
              counter=counter+1;
         end
          xlabel('frequency(Hz)');
          ylabel('Characteristic_Impedance(Zo)(ohm)');
          grid;
        end
      
     if (r == 2)   %plotting  Gamma
         
         for counter=2:6  %Gamma in polar form
              
              figure(3)
              Q=compass(real(Gamma(8-counter)),imag(Gamma(8-counter)));
              set(Q,'LineWidth',2','MarkerSize',4);
         if (counter == 2)
              text(real(Gamma(counter)),imag(Gamma(counter)),['  f=100kHz ',' |Gamma1|=',num2str(Gampol(counter)),' arg(Gamma1)= ',num2str(Gampol(counter+6))]);
         end  
         if (counter == 3)
              text(real(Gamma(counter)),imag(Gamma(counter)),['  f=10MHz ',' |Gamma2|=',num2str(Gampol(counter)),' arg(Gamma2)= ',num2str(Gampol(counter+6))]);
         end  
         if (counter == 4)
              text(real(Gamma(counter)),imag(Gamma(counter)),['  f=900MHz ',' |Gamma3|=',num2str(Gampol(counter)),' arg(Gamma3)= ',num2str(Gampol(counter+6))]);
         end  
         if (counter == 5)
              text(real(Gamma(counter)),imag(Gamma(counter)),['  f=2GHz ',' |Gamma4|=',num2str(Gampol(counter)),' arg(Gamma4)= ',num2str(Gampol(counter+6))]);
         end
         
         if (counter == 6)
              text(real(Gamma(counter)),imag(Gamma(counter)),['  f=6kHz ',' |Gamma5|=',num2str(Gampol(counter)),' arg(Gamma5)= ',num2str(Gampol(counter+6))]);
         end  
              hold on;
              counter=counter+1;
          end
          
          for counter=1:6 % Alpha comp. of Gamma in f domain
              figure(4)
              stem(f(counter),real(Gamma(counter)),'LineWidth',2);
              if (counter == 1)
              text(f(counter),real(Gamma(counter)),['  f=0Hz',]);
              end
              if (counter == 2)
              text(f(counter),real(Gamma(counter)),['  f=100kHz','  Alpha1=',num2str(real(Gamma(counter)))]);
              end
              if (counter == 3)
              text(f(counter),real(Gamma(counter)),['  f=10MHz','  Alpha2=',num2str(real(Gamma(counter)))]);
              end
              if (counter == 4)
              text(f(counter),real(Gamma(counter)),['  f=900MHz','  Alpha3=',num2str(real(Gamma(counter)))]);
              end
              if (counter == 5)
              text(f(counter),real(Gamma(counter)),['  f=2GHz','  Alpha4=',num2str(real(Gamma(counter)))]);
              end
              if (counter == 6)
              text(f(counter),real(Gamma(counter)),['  f=6GHz','  Alpha5=',num2str(real(Gamma(counter)))]);
              end
              hold on;
              counter=counter+1;
          end
          
          for counter=1:6  %Beta comp. of Gamma in f domain
              figure(4)
              stem(f(counter),imag(Gamma(counter)),'r','LineWidth',2);
              if (counter == 2)
              text(f(counter),imag(Gamma(counter)),['   f=100kHz','   Beta1=',num2str(imag(Gamma(counter)))]);
              end
              if (counter == 3)
              text(f(counter),imag(Gamma(counter)),['   f=10MHz','   Beta2=',num2str(imag(Gamma(counter)))]);
              end
              if (counter == 4)
              text(f(counter),imag(Gamma(counter)),['   f=900MHz','   Beta3=',num2str(imag(Gamma(counter)))]);
              end
              if (counter == 5)
              text(f(counter),imag(Gamma(counter)),['   f=2GHz','   Beta4=',num2str(imag(Gamma(counter)))]);
              end
              if (counter == 6)
              text(f(counter),imag(Gamma(counter)),['   f=6GHz','   Beta5=',num2str(imag(Gamma(counter)))]);
              end
              hold on;
              counter=counter+1;
         end
          xlabel('frequency(Hz)');
          ylabel('Propogation constant');
          grid;
     end
     
     if (r == 3) %Wave&Input Impedance part
         
         if(YY==0)
         ZL=input('Enter the Load Impedance (Re+Im)(ohm):\n');
         Length=input('Enter the length of the Transmission Line "l" (meter):\n');
         stepsize=input('Enter the stepsize of the "l" parameter(m):\n');
         z=0:stepsize:Length;  %Length of the TL
         zL=ZL./Zo; %normalized load impedance
         Beta=imag(Gamma); 
         for count=2:6 %setting the Wave impedance matrix for 5 different frequency 
         Zl(count-1,:)=Zo(count)*(zL(count)+j*tan(Beta(count)*z))./(1+j*zL(count)*tan(Beta(count)*z));
         end
         end
         
         for n=1:5
         
             figure(5)
             subplot(2,3,n);
             plot(z,real(Zl(n,:)));
             hold on;
             subplot(2,3,n);
             plot(z,imag(Zl(n,:)),'r');
             xlabel('Distance from the load(m)');
             Y=Y+1;
             
         end
         
             figure(5)
             subplot(2,3,1);
             ylabel('Zd along the line at 100kHz');
             subplot(2,3,2);
             ylabel('Zd along the line at at 10MHz');
             subplot(2,3,3);
             ylabel('Zd along the line at at 900MHz');
             subplot(2,3,4);
             ylabel('Zd along the line at at 2GHz');
             subplot(2,3,5);
             ylabel('Zd along the line at at 6GHz');
         grid;
         
         for m=1:5
             Zin(m)=Zl(m,stepsize^-1*Length); %setting the Zin array for each freq. as it is the Zl's at l=Length(determined by the user)
         end
         
         Zinpol=rect_to_polar(Zin);
        
         for k=1:5 %plotting the input impedances of each frequency in polar coordinate 
             figure(6)
             M=compass(real(Zin(6-k)),imag(Zin(6-k)));
              set(M,'LineWidth',2','MarkerSize',4);
         if (k == 1)
              text(real(Zin(k)),imag(Zin(k)),['  f=100kHz ',' |Zin1|=',num2str(Zinpol(k)),' arg(Zin1)= ',num2str(Zinpol(k+5))]);
         end  
         if (k == 2)
              text(real(Zin(k)),imag(Zin(k)),['  f=10MHz ',' |Zin2|=',num2str(Zinpol(k)),' arg(Zin2)= ',num2str(Zinpol(k+5))]);
         end  
         if (k == 3)
              text(real(Zin(k)),imag(Zin(k)),['  f=900MHz ',' |Zin3|=',num2str(Zinpol(k)),' arg(Zin3)= ',num2str(Zinpol(k+5))]);
         end  
         if (k == 4)
              text(real(Zin(k)),imag(Zin(k)),['  f=2GHz ',' |Zin4|=',num2str(Zinpol(k)),' arg(Zin4)= ',num2str(Zinpol(k+5))]);
         end  
         if (k == 5)
              text(real(Zin(k)),imag(Zin(k)),['  f=6GHz ',' |Zin5|=',num2str(Zinpol(k)),' arg(Zin5)= ',num2str(Zinpol(k+5))]);
         end  
              hold on;
              k=k+1;
         end
          xlabel('Input Impedances(ohm) in polar form for each frequency');     
     end
     
     if (r == 4)
         
         if(Y==0);
         ZL=input('Enter the Load Impedance (Re+Im)(ohm):\n');
         Length=input('Enter the length of the Transmission Line "l" (meter):\n');
         stepsize=input('Enter the stepsize of the "l" parameter(m):\n');
         z=0:stepsize:Length;  %Length of the TL
         zL=ZL./Zo; %normalized load impedance
         Beta=imag(Gamma); 
         
         for count=2:6 %setting the Wave impedance matrix for 5 different frequency 
         Zl(count-1,:)=Zo(count)*(zL(count)+j*tan(Beta(count)*z))./(1+j*zL(count)*tan(Beta(count)*z));
         end
         
         for m=1:5
             Zin(m)=Zl(m,stepsize^-1*Length); %setting the Zin array for each freq. as it is the Zl's at l=Length(determined by the user)
             end
           Zinpol=rect_to_polar(Zin); 
         end
         
         Veff = input('Enter the voltage value of source(V):\n');
           Vpha = input('Enter the phase angle of the source(in degrees):\n');
           Zg = input('Enter the source impadance(ohm):\n');
           t = input('Which time instant do you want to whole wave form to be plotted at?(s):\n');
           Vg=polar_to_rec(Veff*sqrt(2),Vpha);
           Alpha=real(Gamma);
           
           for count=2:6
           RefCoff(count-1)=(ZL-Zo(count))/(ZL+Zo(count));
           Vop(count-1) =(Vg*Zin(count-1)/(Zg+Zin(count-1))/(exp(j*Beta(count-1)*Length)+RefCoff(count-1)*exp(-j*Beta(count-1)*Length)));%Incident wave voltage phasor
           Von(count-1)=Vop(count-1)*RefCoff(count-1);
           Vz(count-1,:)=abs(Vop(count-1))*exp(Alpha(count-1)*z).*cos(2*pi*f(count)+Beta(count-1)*z+angle(Vop(count-1)))+abs(Von(count-1))*exp(-Alpha(count-1)*z).*cos(2*pi*f(count)-Beta(count-1)*z+angle(Von(count-1)));
           end
           for n=1:5
             figure(7)
             subplot(2,3,n);
             plot(z,Vz(n,:));
             grid; 
             hold on;
             xlabel('Distance from the load');        
           end
           
           figure(7)
             subplot(2,3,1);
             ylabel('Vz along the line at 100kHz');
             subplot(2,3,2);
             ylabel('Vz along the line at at 10MHz');
             subplot(2,3,3);
             ylabel('Vz along the line at at 900MHz');
             subplot(2,3,4);
             ylabel('Vz along the line at at 2GHz');
             subplot(2,3,5);
             ylabel('Vz along the line at at 6GHz');
         
           YY=YY+1;
     end
     
     if (r == 5)
                break;
     end
          x=x+1;          
end    