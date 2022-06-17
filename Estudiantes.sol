//SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Estudiante{

string private _nombre;
string private _apellido;
string private _curso;
address private _docente;
string [] private _promedio;
mapping (string => uint) private _valoracion_materias;
string[] materias;

constructor(string memory name_, string memory lastName_, string memory curso_ )
    {
        _nombre = name_;
        _apellido = lastName_;
        _curso = curso_;

        _docente = msg.sender;
    }

function lastName() public view returns (string memory){
        return _apellido;
    }

function name_apellido() public view returns (string memory){
       return append(_nombre, " ", _apellido);
    }
    function append(string memory a, string memory b, string memory c) internal pure returns (string memory) {

    return string(abi.encodePacked(a, b, c));

}

function curso() public view returns (string memory){
        return _curso;
    }

function set_nota_materia(uint nota, string memory materia) public{

    require(_docente == msg.sender, "El docente es el unico que puede editar");
    require(nota >=0 && nota <= 100, "La nota no puede ser menor a 0 o mayor a 100");
    _valoracion_materias[materia] = nota;
    materias.push(materia);
}
function get_materia(string memory materia) public view returns(uint){
        return _valoracion_materias[materia];
    }

function aprobo(string memory materia) public view returns (bool){
    if(_valoracion_materias[materia] >= 60)
    {   
        return true;
    }
    else{
        return false;
    }
}
    function promedio() public view returns(uint)
    {
        uint promedio_;
        uint largoArray = _promedio.length;
        uint _notaPromedio = 0; 
        for(uint i = 0; i < largoArray; i++)
        {
            _notaPromedio += _valoracion_materias[_promedio[i]];
        }
        promedio_ = _notaPromedio / largoArray;

         
        return promedio_; 
    }
    
}