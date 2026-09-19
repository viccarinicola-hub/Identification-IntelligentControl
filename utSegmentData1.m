function zm = utSegmentData(z,FS,FR)
% SPezzetta il dataset in set più piccoli da FS sample e spostati di FR
% sample (FR>=1).

%  z è un signolo esperimento, dataset nel dominio del tempo rappresentato da un ogetto di tipo iddata.
%  zm oggetto iddata multi-esperimento.
%
%  FR = 1 segmentazione con massima sovrapposizione
%  FR = FS segmentazione continua senza sovrapposizione
%  FR>FS allora alcuni sample z vengono persi.

 
Ns = size(z,1); %dimensione dataset z
m = floor((Ns-FS)/FR)+1; %dimensione set piccoli
zm = cell(1,m); %crea un array di celle
pt = 0; % inizio di ciascun set piccolo
T0 = z.Tstart;
for ct = 1:m
   zm{ct} = z(pt+(1:FS));
   zm{ct}.Tstart = T0;
   pt = pt+FR;
end
zm = merge(zm{:});