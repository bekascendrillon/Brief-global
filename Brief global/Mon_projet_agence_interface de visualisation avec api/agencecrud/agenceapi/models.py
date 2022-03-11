from django.db import models

# Create your models here.

class Operation(models.Model):
    nom_personne = models.CharField('Nom_personne',max_length=30)
    adresse_personne = models.CharField('Adresse_personne',max_length=150)
    telephone_personne = models.IntegerField('Telephone de la personne')
    numero_identification = models.IntegerField('Numero_identification')
    date_operation = models.DateField("Date de l operation")
    lieu_operation = models.CharField('Lieu_operation',max_length=150)
    type_operation = models.CharField('type_operation',max_length=150)
    nom_agence = models.CharField('nom_agence',max_length=150)
    adresse_agence = models.CharField('adresse_agence',max_length=150)
    contact_agence = models.IntegerField('contact_agence')
    numero_compte = models.IntegerField('numero_compte')
    type_compte = models.CharField('type_compte',max_length=150)