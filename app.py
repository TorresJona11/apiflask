from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
from flask_marshmallow import Marshmallow

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:admin1@localhost:3306/apiflask'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

basedatos = SQLAlchemy(app)
ma = Marshmallow(app)

class Contact(basedatos.Model):
    id = basedatos.Column(basedatos.Integer, primary_key=True)
    nombre = basedatos.Column(basedatos.String(100), nullable=False)
    telefono = basedatos.Column(basedatos.String(20), nullable=False)
    correo = basedatos.Column(basedatos.String(100), nullable=False)

    def __init__(self, nombre, telefono, correo):
        self.nombre = nombre
        self.telefono = telefono
        self.correo = correo

basedatos.create_all()

class ContactSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = Contact
        sqla_session = basedatos.session

contact_schema = ContactSchema()
contacts_schema = ContactSchema(many=True)

@app.route('/contactos/todos', methods=['GET'])
def obtener_todos_los_contactos():
    try:
        contacts = Contact.query.all()
        result = contacts_schema.dump(contacts)
        return jsonify(result), 200
    
    except Exception as e:
        return jsonify({'mensaje': 'Error al llamar los datos', 'error': str(e)}), 500


@app.route('/contactos', methods=['GET'])
def obtener_contacto_filtrado():
    try:
        pagina = request.args.get('pagina', 1, type=int)
        pagina_tamaño = request.args.get('pagina_tamaño', 10, type=int)
        
        if pagina and pagina_tamaño:
            contacts = Contact.query.paginate(pagina, pagina_tamaño, False)
            result = {
                'contactos': contacts_schema.dump(contacts.items),
                'total_de_paginas': contacts.pages,
                'pagina_actual': contacts.page,
                'total_de_contactos': contacts.total
            }
        else:
            contacts = Contact.query.all()
            result = contacts_schema.dump(contacts)
        
        return jsonify(result), 200
    
    except Exception as e:
        return jsonify({'mensaje': 'Error al llamar a los contactos', 'error': str(e)}), 500



# Ruta para obtener un contacto por ID
@app.route('/contacto/<int:id>', methods=['GET'])
def obtener_contacto_id(id):
    try:
        contact = Contact.query.get(id)
        if not contact:
            return jsonify({'mensaje': 'Contacto no encontrado'}), 404
        return contact_schema.jsonify(contact), 200
    
    except Exception as e:
        return jsonify({'mensaje': 'Error al obtener el contacto', 'error': str(e)}), 500

# Ruta para agregar un nuevo contacto
@app.route('/contact', methods=['POST'])
def agregar_contacto():
    try:
        nombre = request.json['nombre']
        telefono = request.json['telefono']
        correo = request.json['correo']
        nuevo_contacto = Contact(nombre=nombre, telefono=telefono, correo=correo)
        basedatos.session.add(nuevo_contacto)
        basedatos.session.commit()
        return contact_schema.jsonify(nuevo_contacto), 201
    
    except Exception as e:
        basedatos.session.rollback()
        return jsonify({'mensaje': 'Error al agregar el contacto', 'error': str(e)}), 500

# Ruta para actualizar un contacto por ID
@app.route('/contacto/<int:id>', methods=['PUT'])
def actualizar_contacto(id):
    try:
        contact = Contact.query.get(id)
        if not contact:
            return jsonify({'mensaje': 'Contacto no encontrado'}), 404
        
        contact.nombre = request.json['nombre']
        contact.telefono = request.json['telefono']
        contact.correo = request.json['correo']
        basedatos.session.commit()
        
        return contact_schema.jsonify(contact), 200
    
    except Exception as e:
        basedatos.session.rollback()
        return jsonify({'mensaje': 'Error al actualizar el contacto', 'error': str(e)}), 500

# Ruta para eliminar un contacto por ID
@app.route('/contacto/<int:id>', methods=['DELETE'])
def eliminar_contacto(id):
    try:
        contact = Contact.query.get(id)
        if not contact:
            return jsonify({'mensaje': 'Contacto no encontrado'}), 404
        
        basedatos.session.delete(contact)
        basedatos.session.commit()
        
        return contact_schema.jsonify(contact), 200
    
    except Exception as e:
        basedatos.session.rollback()
        return jsonify({'mensaje': 'Error al eliminar el contacto', 'error': str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True)
