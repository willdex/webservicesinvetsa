<?php
include_once('clsConexion.php');
class Servicio_Mantenimiento extends Conexion
{
	private $codigo;	
	private $fecha;
	private $firma_invetsa;
	private $firma_jefe_planta;
	private $hora_ingreso;
	private $hora_salidas;
	private $id;
	private $id_compania;
	private $id_maquina;
	private $id_tecnico;
	private $revision;
	private $id_sqlite;
	private $imei;
	private $formulario;
	private $imagen_jefe;
	private $jefe_planta;
	private $encargado_maquina;
	private $ultima_visita;
	private $plana_de_incubacion;

	public function Servicio_Mantenimiento()
	{
		parent::Conexion();
		$this->codigo="";		
		$this->fecha="";
		$this->firma_invetsa="";
		$this->firma_jefe_planta="";
		$this->hora_ingreso="";
		$this->hora_salidas="";
		$this->id=0;
		$this->id_compania="";
		$this->id_maquina="";
		$this->id_tecnico="";
		$this->revision="";
		$this->id_sqlite="";
		$this->imei="";
		$this->formulario="";
		$this->imagen_jefe="";
		$this->jefe_planta="";
		$this->encargado_maquina="";
		$this->ultima_visita="";
		$this->planta_de_incubacion="";
		}
		
	public function Servicio_Mantenimiento2($codigo,$fecha,$firma_invetsa,$firma_jefe_planta,$hora_ingreso,$hora_salidas,$id_compania,$id_maquina,$id_tecnico,$revision,$id_sqlite,$imei,$formulario,$foto_jefe,$jefe_planta,$encargado_maquina,$ultima_visita,$planta_de_incubacion)
	{
		
		$this->codigo=$codigo;
		$this->fecha=$fecha;	
		$this->firma_invetsa=$firma_invetsa;
		$this->firma_jefe_planta=$firma_jefe_planta;
		$this->hora_ingreso=$hora_ingreso;
		$this->hora_salidas=$hora_salidas;
		$this->id_compania=$id_compania;	
		$this->id_maquina=$id_maquina;
		$this->id_tecnico=$id_tecnico;
		$this->revision=$revision;
		$this->id_sqlite=$id_sqlite;
		$this->imei=$imei;
		$this->formulario=$formulario;
		$this->imagen_jefe=$foto_jefe;
		$this->jefe_planta=$jefe_planta;
		$this->encargado_maquina=$encargado_maquina;
		$this->ultima_visita=$ultima_visita;
		$this->planta_de_incubacion=$planta_de_incubacion;
	}
	public function get_codigo()
	{
		return $this->codigo;
	}
	
	public function get_fecha()
	{
		return $this->fecha;
	}
	public function get_firma_invetsa()
	{
		return $this->firma_invetsa;
	}
	public function get_firma_jefe_planta()
	{
		return $this->firma_jefe_planta;
	}
	
	public function get_hora_ingreso()
	{
		return $this->hora_ingreso;
	}
	
	public function get_hora_salidas()
	{
		return $this->hora_salidas;
	}
	
	public function get_id()
	{
		return $this->id;
	}
	
	public function get_id_compania()
	{
		return $this->id_compania;
	}
	public function get_id_maquina()
	{
		return $this->id_maquina;
	}
	
	public function get_id_tecnico()
	{
		return $this->id_tecnico;
	}
	
	public function get_revision()
	{
		return $this->revision;
	}
	public function get_id_sqlite()
	{
		return $this->id_sqlite;
	}
	public function get_imei()
	{
		return $this->imei;
	}
	
	
	public function guardar()
	{

		$sql="INSERT into servicio_mantenimiento(codigo,fecha,firma_invetsa,firma_jefe_planta,hora_ingreso,hora_salidas,id_compania,id_maquina,id_tecnico,revision,id_sqlite,imei,formulario,jefe_planta,encargado_maquina,ultima_visita,planta_de_incubacion)values('$this->codigo','$this->fecha','$this->firma_invetsa','$this->firma_jefe_planta','$this->hora_ingreso','$this->hora_salidas','$this->id_compania','$this->id_maquina','$this->id_tecnico','$this->revision','$this->id_sqlite','$this->imei','$this->formulario','$this->jefe_planta','$this->encargado_maquina','$this->ultima_visita','$this->planta_de_incubacion')";
   		
   		$id_servicio_mantenimiento=parent::ejecutar_obtener_id($sql);
		

		if($id_servicio_mantenimiento!="-1")
		{
		$direccion_firma_invetsa="servicio_mantenimiento/firma/".$id_servicio_mantenimiento."_firma_invetsa_".$this->fecha.".txt";
		$direccion_firma_empresa="servicio_mantenimiento/firma/".$id_servicio_mantenimiento."_firma_empresa_".$this->fecha.".txt";
		$direccion_foto_jefe="servicio_mantenimiento/imagen/".$id_servicio_mantenimiento."_foto_jefe_".$this->fecha.".txt";
		
		$this->guardar_imagen($this->firma_invetsa,$direccion_firma_invetsa);
		$this->guardar_imagen($this->firma_jefe_planta,$direccion_firma_empresa);
		$this->guardar_imagen($this->imagen_jefe,$direccion_foto_jefe);
 		$actualizar="UPDATE servicio_mantenimiento set firma_invetsa='$direccion_firma_invetsa', firma_jefe_planta='$direccion_firma_empresa',imagen_jefe='$direccion_foto_jefe' where id='$id_servicio_mantenimiento'";
		
		$actualizado=parent::ejecutar($actualizar);

			return true;
		}
		else
			return false;
	}
	public function buscar()
	{
		$sql="SELECT * from servicio_mantenimiento";
		return parent::ejecutar($sql);
	}	

	public function existe_id_sqlite($id_sqlite,$imei)
	{
		$sql="SELECT * from servicio_mantenimiento where id_sqlite='$id_sqlite' and imei='$imei'";
		$consulta=parent::ejecutar($sql);
		
		if(mysqli_num_rows($consulta) != 0)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	public function get_id_por_sqlite($id_sqlite,$imei)
	{
		$sql="SELECT id from servicio_mantenimiento where id_sqlite='$id_sqlite' and imei='$imei' limit 1";
		$consulta=parent::ejecutar($sql);
		
		if(mysqli_num_rows($consulta) != 0)
		{
			return mysqli_fetch_assoc($consulta)['id'];
		}
		else
		{
			return "-1";
		}
	}
	public function guardar_imagen($dato,$file)
	{
		if($dato!="")
		{
		$success=file_put_contents($file, $dato);
		}
	}
	public function vaciar_registro($id_SM)
	{

		$sql_detalle_DL="DELETE from detalle_limpieza where id_servicio='$id_SM'";
		$sql_detalle_L="DELETE from limpieza where id_servicio='$id_SM'";
		$sql_detalle_DIF="DELETE from detalle_inspeccion_funcionamiento where id_servicio='$id_SM'";
		$sql_detalle_DIV="DELETE from detalle_inspeccion_visual where id_servicio='$id_SM'";
		$sql_detalle_IF="DELETE from inspeccion_funcionamiento where id_servicio='$id_SM'";
		$sql_detalle_IV="DELETE from inspeccion_visual where id_servicio='$id_SM'";
		$sql_detalle_SM="DELETE from servicio_mantenimiento where id='$id_SM'";

		$sw_DL=parent::ejecutar($sql_detalle_DL);
		$sw_L=parent::ejecutar($sql_detalle_L);
		$sw_DIF=parent::ejecutar($sql_detalle_DIF);
		$sw_DIV=parent::ejecutar($sql_detalle_DIV);
		$sw_IF=parent::ejecutar($sql_detalle_IF);
		$sw_IV=parent::ejecutar($sql_detalle_IV);
		$sw_SM=parent::ejecutar($sql_detalle_SM);

		if($sw_SM==true)
		{
			return true;
		}
		else
			{return false;}
	}

	public function get_id_max($id_tecnico,$imei)
	{
		$sql="SELECT max(id) as 'id' from servicio_mantenimiento where id_tecnico='$id_tecnico' and imei='$imei'";
		$consulta=parent::ejecutar($sql);
		if(mysqli_num_rows($consulta) != 0 )
		{$fila=mysqli_fetch_object($consulta);
			if($fila->id!=null)
			{
			 return $fila->id;	
			}
			else
			{
				return "1";
			}
			
		}
		else
		{
			return '1';
		}
	}
	public function get_formulario_por_id_y_maquina($id_formulario)
	{
		$sql="SELECT s.*,c.nombre as 'compania',c.direccion as 'direccion',m.codigo as 'codigo_maquina',te.nombre as 'tecnico' FROM servicio_mantenimiento s,compania c,maquina m,tecnico te WHERE s.id_compania=c.id and s.id_maquina=m.id and s.id_tecnico=te.id and s.id='$id_formulario' ";
		$consulta=parent::ejecutar($sql);
				
		if(mysqli_num_rows($consulta) != 0 )
		{$fila=mysqli_fetch_object($consulta);
			return $fila;
		}
		else
		{
			return '-1';
		}
	}		
}
/*
		DELETE from detalle_limpieza ;
		DELETE from limpieza ;
		DELETE from detalle_inspeccion_funcionamiento;
		DELETE from detalle_inspeccion_visual ;
		DELETE from inspeccion_funcionamiento ;
		DELETE from inspeccion_visual ;
		DELETE from servicio_mantenimiento ;


*/
?>