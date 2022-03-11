from rest_framework import viewsets
from . import models
from . import serializers

class OperationViewset(viewsets.ModelViewSet):
    queryset = models.Operation.objects.all()
    serializer_class = serializers.OperationSerializer