<?php
include_once ('../clsServicio_matenimiento.php');
include_once ('../clsInspeccion_visual.php');
include_once ('../clsInspeccion_funcionamiento.php');
include_once ('../clsLimpieza.php');
include_once ('../clsDetalle_inspeccion_visual.php');
include_once ('../clsDetalle_inspeccion_funcionamiento.php');
include_once ('../clsDetalle_limpieza.php');



$id_servicio=$_GET['id'];

$servicio_mantenimiento=New Servicio_mantenimiento();
$inspeccion_visual= New Inspeccion_visual();
$inspeccion_funcionamiento=New Inspeccion_funcionamiento();
$detalle_inspeccion_visual=New Detalle_inspeccion_visual();
$detalle_inspeccion_funcionamiento=New Detalle_inspeccion_funcionamiento();
$limpieza=New Limpieza();
$detalle_limpieza=New Detalle_limpieza();

$rpt_sm=$servicio_mantenimiento->get_formulario_por_id_y_maquina($id_servicio);
$rpt_inspeccion_visual=$inspeccion_visual->get_formulario_por_id_sm($id_servicio);
$rpt_inspeccion_funcionamiento=$inspeccion_funcionamiento->get_formulario_por_id_sm($id_servicio);
$rpt_limpieza=$limpieza->get_formulario_por_id_sm($id_servicio);
//$rpt_detalle_puntuacion=$detalle_puntuacion->get_formulario_detalle_puntuacion_por_id_sim_y_puntuacion($id_sistema,$id_puntuacion);
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>SERVICIO DE MANTENIMIENTO</title>
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
     border: 2px solid #000;
        height: 50px;

       }
       #titutlo tr td{       
         border: 0px solid #000;
         
       }
       #tabla_contenido tr td ,#tabla_puntuacion tr td{
        height: 40px;
         border: 1px solid #000;
         padding-left: 7px;
         padding-right: : 7px;
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
    <TABLE id=titulo>
      <tr>
        <td>
          <img style="width: 50px; height: 50px" src="imagen/invetsa.png">
         </td>
         <td >
         <h2 align="center">SERVICIO DE MANTENIMIENTO</h2>
         <h3 align="center">INFORME DE INSPECCION</h3>
         <h3 align="center">MAQUINA <b>TWIN SHOT</b></h3>
        </td>
        <td >
         Nro:<?php $rpt_sm->id;?>
         Codigo: <?php echo $rpt_sm->codigo;?> <br>
         Revision: <?php echo $rpt_sm->revision;?><br>
        </td>
      </tr>
      <tr>
        <td style="text-align: left;" >
         <b>COMPAÑIA:<?php echo $rpt_sm->compania; ?>  <br>
         <b>PLANTA DE INCUBACION:</b><?php echo $rpt_sm->planta_de_incubacion; ?><br>
         <b>DIRECCION: </b><?php echo $rpt_sm->direccion; ?> años<br>
         <b>JEFE DE PLANTA: </b><?php echo $rpt_sm->jefe_planta;?><br>
         <b>ENCARGADO DE MAQUINA:</b> <?php echo $rpt_sm->encargado_maquina;?><br>
        </td>
        <td style="text-align: left;" colspan="2" >
        <b>CODIGO MAQUINA:</b> <?php echo $rpt_sm->codigo_maquina; ?> <br>
        <b> FECHA:</b> <?php echo $rpt_sm->fecha; ?><br>
        <b> HORA DE INGRESO:</b> <?php echo $rpt_sm->hora_ingreso; ?><br>
        <b> HORA DE SALIDA:</b> <?php echo $rpt_sm->hora_salidas; ?><br>
        <b> ULTIMA VISITA: </b><?php echo $rpt_sm->ultima_visita; ?><br>
        </td>
      </tr>


    </TABLE>
     

     
    </header>
    <main>
    <h3>1.- INSPECCION VISUAL</h3>
      <table id=tabla_contenido>
          <tr >
            <th>CODIGO</th>
            <th>DESCRIPCION</th>
            <th>BUENO </th>
            <th>REGULAR</th>
            <th>MALO</th>
          </tr>
          <?php
          $rpt_inspeccion=mysqli_fetch_object($rpt_inspeccion_visual);
          $id_inspeccion_v=$rpt_inspeccion->id;
         $rpt_detalle_inspeccion_visual=New Detalle_inspeccion_visual();
            $rpt_detalle_inspeccion_visual=$rpt_detalle_inspeccion_visual->get_formulario_por_id_sm_y_id_inspeccion($id_servicio,$id_inspeccion_v);
            if($rpt_detalle_inspeccion_visual!="-1"){
            while ($fila=mysqli_fetch_object($rpt_detalle_inspeccion_visual)) {
             
            echo "<tr>
                  <td>$fila->codigo</td>
                  <td>$fila->descripcion</td>
                  <td>$fila->bueno</td>
                  <td>$fila->regular</td>
                  <td>$fila->malo</td>
                  </tr>
                  ";
            }
          }
          ?>         
      </table>
      <br>

<h4>OBSERVACIONES:</h4>
<?php
 echo $rpt_inspeccion->observaciones; ?>
<h4>PIEZAS CAMBIADAS:</h4>
<?php echo $rpt_inspeccion->piezas_cambiadas; ?>


      <h3>2.- INSPECCION DEL FUNCIONAMIENTO</h3> 
 <table id=tabla_contenido>
          <tr >
            <th>CARACTERISTICA DE EVALUACION</th>
            <th>BUENO </th>
            <th>MALO</th>
          </tr>
          <?php
          $rpt_inspeccion_func=mysqli_fetch_object($rpt_inspeccion_funcionamiento);
            $id_inspeccion_f=$rpt_inspeccion_func->id;
           $rpt_detalle_inspeccion_funcionamiento=New Detalle_inspeccion_funcionamiento();
            $rpt_detalle_inspeccion_funcionamiento=$rpt_detalle_inspeccion_funcionamiento->get_formulario_por_id_sm_y_id_inspeccion($id_servicio,$id_inspeccion_f);
            if($rpt_detalle_inspeccion_visual!="-1"){
            while ($fila=mysqli_fetch_object($rpt_detalle_inspeccion_funcionamiento)) {
             
            echo "<tr>
                  <td>$fila->criterio_evaluacion</td>
                  <td>$fila->bueno</td>
                  <td>$fila->malo</td>
                  </tr>
                  ";
            }
          }
          ?>         
      </table>
         <br>

<h4>OBSERVACIONES:</h4>
<?php 
echo $rpt_inspeccion_func->observaciones; ?>
<h4>FRECUENCIA DE USO:</h4>
<?php echo $rpt_inspeccion_func->frecuencia_de_uso; ?>

<br>
<h3>3.- LIMPIEZA Y DESINFECCION</h3> 
 <table id=tabla_contenido>
          <tr >
            <th>CARACTERISTICA DE EVALUACION</th>
            <th>BUENO </th>
            <th>MALO</th>
          </tr>
          <?php
          $rpt_limpieza=mysqli_fetch_object($rpt_limpieza);
           $id_limipieza=$rpt_limpieza->id;
          $rpt_detalle_limpieza=New Detalle_limpieza();
            $rpt_detalle_limpieza=$rpt_detalle_limpieza->get_formulario_por_id_sm_y_id_inspeccion($id_servicio,$id_limipieza);
            if($rpt_detalle_limpieza!="-1"){
            while ($fila=mysqli_fetch_object($rpt_detalle_limpieza)) {
             
            echo "<tr>
                  <td>$fila->criterio_evaluacion</td>
                  <td>$fila->bueno</td>
                  <td>$fila->malo</td>
                  </tr>
                  ";
            }
          }
          ?>         
      </table>
         <br>

<h4>OBSERVACIONES:</h4>
<?php
 echo $rpt_limpieza->observaciones; ?>
<h4>CANTIDAD DE AVES VACUNADAS/DIA:</h4>
<?php echo $rpt_limpieza->cantidad_aves_vacunadas; ?>

<br><br>


<?php
$src_firma_empresa="";
$src_firma_invetsa="";
$src_imagen_jefe="";

 if(file_exists("../".$rpt_sm->firma_invetsa))
{
  $src_firma_empresa="data:image/jpeg;base64,".file_get_contents("../".$rpt_sm->firma_invetsa);
}
 if(file_exists("../".$rpt_sm->firma_jefe_planta))
{
  $src_firma_invetsa="data:image/jpeg;base64,".file_get_contents("../".$rpt_sm->firma_jefe_planta);
}
if(file_exists("../".$rpt_sm->imagen_jefe))
{
  $src_imagen_jefe="data:image/jpeg;base64,".file_get_contents("../".$rpt_sm->imagen_jefe);
}


echo "<table id=tabla_contenido>
<tr>
<th>IMAGEN DE JEFE DE PLANTA</th>
</tr>
<tr>
<td>
<img src='$src_imagen_jefe' width=300px/>
</td>
</tr>
</table>
<br>
<br>
<br>
";

echo "<table id=tabla_contenido>
<tr>
<th>FIRMA INVETSA</th>
<th>FIRMA EMPRESA</th>
</tr>
<tr>
<td>
<img src='$src_firma_invetsa' width=300px/>
</td>
<td>
<img src='$src_firma_empresa' width=300px/>
</td>
</tr>
</table>";
?>
    </main>
    <footer>
  
      Invoice was created on a computer and is valid without the signature and seal.
    </footer>
  </body>
 
</html>