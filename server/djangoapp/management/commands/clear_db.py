from django.core.management.base import BaseCommand

from djangoapp.models import CarMake, CarModel


class Command(BaseCommand):
    help = "Clears all car make and car model data from the database"

    def handle(self, *args, **kwargs):
        try:
            car_make_count = CarMake.objects.count()
            car_model_count = CarModel.objects.count()

            CarMake.objects.all().delete()
            CarModel.objects.all().delete()

            self.stdout.write(
                self.style.SUCCESS(
                    f"Successfully cleared {car_make_count} car makes and "
                    f"{car_model_count} car models from the database"
                )
            )
        except Exception as e:
            self.stdout.write(
                self.style.ERROR(f"Error clearing database: {str(e)}")
            )
