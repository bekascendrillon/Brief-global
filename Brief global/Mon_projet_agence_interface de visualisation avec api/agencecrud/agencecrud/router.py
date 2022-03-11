from agenceapi.viewsets import OperationViewset
from rest_framework import routers

router = routers.DefaultRouter()
router.register("operation",OperationViewset)