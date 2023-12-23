  clear all
  close all
  clc
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   %Principle of TMAS
   W=0.15;         % ultrasonic power. £¨W/cm^2£©
   B=3;            % the intensity of the magetostatic field.£¨T£©
   SG=0.5;         % the conductive of the tissue. (S/m)
   d=1120;         %the tissue density. kg/m^3
   c=1540;         % the ultrasound speed. m/s
   P=(W*10^4*d*c).^(1/2);  %(W)
   J=2^(1/2)*SG*P*B/(d*c); 
   J=J*100; % (uA/cm^2)
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   f=500000; % (Hz)ultrasound frequency
   f1=50;    % (Hz)modulation frequency
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   % Fixed parameters for Hodgkin-Huxley neuron model
   C=1;       %£¨¦ÌF/cm2£©
   g_Na=120;  %£¨mS/cm2£©
   g_K=36;    %£¨mS/cm2£©
   g_L=0.3;   %£¨mS/cm2£©
   V_Na=115;  %£¨mV£©
   V_K=-12;   %(mV)
   V_L=10.59; %(mV)
   
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   t1=400;            
   t=0:0.0001:t1;    
   t=t';
   u=zeros(size(t)); 
   ut=[t,u];
   [t,x,y]=sim('HH_simulink',t1,[],ut);
   V=y;
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% drawing 
   figure (1)                                    
   plot(t,V);              
   xlabel('t (ms)');
   ylabel('V (mV)');
   figure (2)
   plot(V(1000000:4000001,1),m(1000000:4000001,2));  
   xlabel('V (mV)');
   ylabel('m');


