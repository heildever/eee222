function G =Conductance_per_length(Sig,d,D)

G=pi*Sig/log(D/d+sqrt((D/d)^2-1));

end

