import 'package:flutter/material.dart';
import 'package:municipality_app/common/widgets/loading/loading_service_card.dart';
import 'package:municipality_app/models/service_model.dart';
import 'package:municipality_app/pages/service_details_page.dart';
// import 'package:municipality_app/previous/presentation/common/enums/screen.dart';
// import 'package:municipality_app/previous/presentation/common/extensions/navigator.dart';

class ServiceCard extends StatelessWidget {
  final ServiceModel service;

  const ServiceCard({Key? key, required this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return service.isEmpty
        ? LoadingServiceCard()
        : GestureDetector(
            onTap: () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ServiceDetailsPage(service.id ?? 0),
                ),
              )
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 40,vertical: 5),
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 15.0,
                    spreadRadius: 0.5,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  service.getName(context),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        fontSize: 14,
                        fontStyle: FontStyle.normal,
                      ),
                ),
              ),
            ),
          );
  }
}
