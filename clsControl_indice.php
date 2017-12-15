<?php
include_once('clsConexion.php');
class control_indice extends Conexion
{
	private $id;
	private $id_hoja_verificacion;
	private $id_vacunador;
	private $nro_heridos;
	private $nro_mala_posicion;
	private $nro_mojados;
	private $nro_pollos_controlados;
	private $nro_pollos_no_vacunados;
	private $nro_pollos_vacunado;
	private $nro_pollos_vacunados_correctamente;
	private $puntaje;
	private $imei;

	public function control_indice ()
	{
		parent::Conexion();
		$this->id=0;
		$this->id_hoja_verificacion="";
		$this->id_vacunador="";
		$this->nro_heridos="";
		$this->nro_mala_posicion="";
		$this->nro_mojados="";
		$this->nro_pollos_controlados="";
		$this->nro_pollos_no_vacunados="";
		$this->nro_pollos_vacunado="";
		$this->nro_pollos_vacunados_correctamente="";
		$this->puntaje=0;
		$this->imei="";
	}
		
	public function preparar($id,$id_hoja_verificacion,$id_vacunador,$nro_heridos,$nro_mala_posicion,$nro_mojados,$nro_pollos_controlados,$nro_pollos_no_vacunados,$nro_pollos_vacunado,$nro_pollos_vacunados_correctamente,$puntaje,$imei)
	{
		$this->id=$id;
		$this->id_hoja_verificacion=$id_hoja_verificacion;
		$this->id_vacunador=$id_vacunador;
		$this->nro_heridos=$nro_heridos;
		$this->nro_mala_posicion=$nro_mala_posicion;
		$this->nro_mojados=$nro_mojados;
		$this->nro_pollos_controlados=$nro_pollos_controlados;
		$this->nro_pollos_no_vacunados=$nro_pollos_no_vacunados;
		$this->nro_pollos_vacunado=$nro_pollos_vacunado;
		$this->nro_pollos_vacunados_correctamente=$nro_pollos_vacunados_correctamente;
		$this->puntaje=$puntaje;
		$this->imei=$imei;

	}
	public function getid()
	{
		return $this->id;
	}
	public function getid_hoja_verificacion()
	{
		return $this->id_hoja_verificacion;
	}
	public function getid_vacunador()
	{
		return $this->id_vacunador;
	}
	public function getnro_heridos()
	{
		return $this->nro_heridos;
	}
	public function getnromala_posicion()
	{
		return $this->nro_mala_posicion;
	}
	public function getnro_mojados()
	{
		return $this->nro_mojados;
	}
	public function getnro_pollos_controlados()
	{
		return $this->nro_pollos_controlados;
	}
	public function getnro_pollos_no_vacunados()
	{
		return $this->nro_pollos_no_vacunados;
	}
	public function getnro_pollos_vacunados()
	{
		return $this->nro_pollos_vacunado;
	}
	public function getnro_pollos_vacunados_correctamente()
	{
		return $this->nro_pollos_vacunados_correctamente;
	}
	public function getnro_puntaje()
	{
		return $this->puntaje;
	}
	public function getimei()
	{
		return $this->imei;
	}
	public function guardar()
	{
		$sql="insert into control_indice(id,id_hoja_verificacion,id_vacunador,nro_heridos,nro_mala_posicion,nro_mojados,nro_pollos_controlados,nro_pollos_no_vacunados,nro_pollos_vacunado,nro_pollos_vacunados_correctamente,puntaje,imei)values('$this->id','$this->id_hoja_verificacion','$this->id_vacunador','$this->nro_heridos','$this->nro_mala_posicion','$this->nro_mojados','$this->nro_pollos_controlados','$this->nro_pollos_no_vacunados','$this->nro_pollos_vacunado','$this->nro_pollos_vacunados_correctamente','$this->puntaje','$this->imei')";

		if(parent::ejecutar($sql))
			return true;
		else
			return false;
	}
	public function buscar()
	{
		$sql="select * from control_indice";
		return parent::ejecutar($sql);
	}	
	public function get_formulario_por_id_hoja($id_hoja)
	{
		$sql="SELECT c.*,v.nombre as'vacunador' from control_indice c,vacunador v WHERE c.id_vacunador=v.id and  c.id_hoja_verificacion='$id_hoja' order by c.id asc";
		$consulta=parent::ejecutar($sql);
				
		if(mysqli_num_rows($consulta) != 0 )
		{
			return $consulta;
		}
		else
		{
			return '-1';
		}
	}	
	
}

?>