function R = Resistance_per_length(f,Sigc,Ucr,d,Uo)

R=2*sqrt(pi.*f*Ucr*Uo/Sigc)./(pi*d);

end

