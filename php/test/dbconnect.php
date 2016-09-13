<?php
    $conectabd = pg_connect("host=ec2-54-225-244-221.compute-1.amazonaws.com port=5432 dbname=dbncioemvhnvem user=ioyeydqurpdsft password=POIt7rugt35VnJYJQBiGhvfmsv");

     if ($conectabd) {
        //Caso queira Imprimir na Tela a mensagem, retirar o comentário
        //echo "Conectado com: " . pg_host($conectabd) . "<br/> ";
     }
     else {
        echo pg_last_error($conectabd);
        exit;
     }
?>