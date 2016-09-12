create trigger insertRealizaACE_trig
before insert on RealizaACE for each row
execute procedure insertRealizaACE_proc();
