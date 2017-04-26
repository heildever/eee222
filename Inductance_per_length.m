function L = Inductance_per_length(Ur,d,D,Uo)

L=Ur*Uo*log(D/d+sqrt((D/d)^2-1))/pi;


end

