<?php
include_once("../clsSistema_integral.php");
include_once("../clsPuntuacion.php");
include_once("../clsDetalle_puntuacion.php");
include_once("../clsPeso.php");

$sistema_integral=New Sistema_integral();
$puntuacion= New Puntuacion();
$detalle_puntuacion=New Detalle_puntuacion();
$peso=New Peso();

$id_sistema=$_GET['id'];

$rpt_sim=$sistema_integral->get_formulario_por_id_sim($id_sistema);
$rpt_puntuacion=$puntuacion->get_formulario_puntuacion_por_id_sim($id_sistema);
$rpt_peso=$peso->get_formulario_peso_por_id_sim($id_sistema);

//$rpt_detalle_puntuacion=$detalle_puntuacion->get_formulario_detalle_puntuacion_por_id_sim_y_puntuacion($id_sistema,$id_puntuacion);
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>SISTEMA INTEGRAL DE MONITOREO</title>
     <style type="text/css">
       #tabla_contenido,#tabla_puntuacion{
        border:1px solid #000; 
        margin: 5px;
        align-content: top;
        background: #d9ffcc;
       }
       #tabla_puntuacion
       {
        width: 350px;
       }
       th{
         background-color: #4CAF50;
    color: white;
     border: 1px solid #000;
        height: 50px;

       }
       td{
        height: 40px;
       }
       div{
        height: 100%;
       }
       table
       {
        border-collapse: collapse;
        font-family: arial;
       }
     </style>
  </head>
  <body>
    <header class="clearfix">
    <TABLE>
      <tr>
        <td>
          <img style="width: 50px; height: 50px" src="imagen/invetsa.png">
         </td>
         <td>
         <h2 align="center">SIM (SISTEMA INTEGRAL DE MONITOREO)</h2>
         <h3 align="center">Invetsa Veterinaria S.A.</h3>
        </td>
        <td>
         Codigo: <?php echo $rpt_sim->codigo;?> <br>
         Revision: <?php echo $rpt_sim->revision;?><br>
        </td>
      </tr>
      <tr>
        <td style="text-align: left;">
         EMPRESA:<?php echo $rpt_sim->empresa; ?>  <br>
         GRANJA:<?php echo $rpt_sim->granja; ?><br>
         EDAD: <?php echo $rpt_sim->edad; ?> años<br>
         SEXO: <?php echo $rpt_sim->sexo;?><br>
        </td>
        <td style="text-align: left;" colspan="2">
         ZONA: <?php echo $rpt_sim->zona; ?> <br>
         GALPON: <?php echo $rpt_sim->codigo_galpon; ?><br>
         Nro. de POLLOS: <?php echo $rpt_sim->nro_pollos; ?><br>
         FECHA: <?php echo $rpt_sim->fecha; ?><br>
        </td>
      </tr>


    </TABLE>
     

     
    </header>
    <main>
      <table id=tabla_contenido>
          <tr >
            <th>Peso Corporal(g)</th>
            <th>Peso Brusca (g)</th>
            <th>Peso de Brazo (g) </th>
            <th>Peso de Timo (g)</th>
            <th>Peso de Higado (g)</th>
            <th>Indice Bursal (g)</th>
            <th>Indice Timico</th>
            <th>Indice Hepatico</th>
            <th>Indice bursometro</th>
          </tr>
          <?php

            if($rpt_peso!="-1"){
            while ($fila=mysqli_fetch_object($rpt_peso)) {
              if($fila->id=="6")
              {
                ?>
                <tr style="background:#a56;">
              <?php             
              }
              else
              {
                ?>
                <tr>
                <?php
              }
            echo "
                  <td>$fila->peso_corporal</td>
                  <td>$fila->peso_bursa</td>
                  <td>$fila->peso_brazo</td>
                  <td>$fila->peso_timo</td>
                  <td>$fila->peso_higado</td>
                  <td>$fila->indice_bursal</td>
                  <td>$fila->indice_timico</td>
                  <td>$fila->indice_hepatico</td>
                  <td>$fila->bursometro</td>
                  </tr>
                  ";
            }
          }
          ?>         
      </table>
      <table>
    

 <?php

            if($rpt_peso!="-1"){
              
            while ($objeto=mysqli_fetch_object($rpt_puntuacion)) {
              $bajo=$objeto->id % 2;
             
              if($bajo==1){
                echo "<tr>";
              }
                echo "<td>";
              echo "<div ><table id=tabla_puntuacion >";
              $rpt_detalle_puntuacion=$detalle_puntuacion->get_formulario_detalle_puntuacion_por_id_sim_y_puntuacion($id_sistema,$objeto->id);
              echo "
                <tr>
                <th colspan=2>
                $objeto->id $objeto->nombre
                </th>
                </tr>
              ";
              if($rpt_detalle_puntuacion!="-1"){
              while($fila=mysqli_fetch_object($rpt_detalle_puntuacion)){
            echo "
                  <tr>
                  <td>$fila->nombre</td>
                  <td>$fila->estado</td>
                  </tr>
                  ";
            }
          }
           echo "</table></div>";

          }
          if($bajo==0){
                echo "</tr>";
              }
              echo "</td>";
          }
          ?>     

</table>

<b>Observaciones:</b><br>
<?php echo $rpt_sim->observaciones;?>
<br>
<br>
<?php
if(file_exists("../".$rpt_sim->firma_invetsa))
{
  $contenido="data:image/jpeg;base64,".file_get_contents("../".$rpt_sim->firma_invetsa);


  
echo "<img src='$contenido'>";
}
else
{
  echo "no existe";
}
?>
    </main>
    <footer>
  
      Invoice was created on a computer and is valid without the signature and seal.
    </footer>
  </body>
 
</html>