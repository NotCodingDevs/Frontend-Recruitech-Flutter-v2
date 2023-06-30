import 'package:flutter/material.dart';
import 'package:frontend_recruitech_flutter_v2/profile/data/remote/services/profile_service.dart';
import 'package:frontend_recruitech_flutter_v2/profile/ui/developer_profile/developer_profile_view.dart';
import 'package:frontend_recruitech_flutter_v2/recruitment/ui/social/developer_card.dart';

import '../../../profile/data/remote/models/developer.dart';
import '../../../security/data/remote/models/user.dart';
import '../../../shared/ui/widgets/form_field.dart';
import '../../../shared/utils/validator.dart';

class NetworkView extends StatefulWidget {
  NetworkView({super.key, required this.user, required this.developers});
  User user;
  List<Developer> developers;

  @override
  State<NetworkView> createState() => _NetworkViewState();
}

class _NetworkViewState extends State<NetworkView> {
  TextEditingController searchController = TextEditingController();
  Validator validator = Validator();
  ProfileService profileService = ProfileService();

  Future<void> refreshNewtork() async {
    List<Developer> developerListUpdated =
        await profileService.featchAllDevelopers();

    setState(() {
      widget.developers = developerListUpdated;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          padding: EdgeInsets.all(24.0),
          child: RefreshIndicator(
            onRefresh: refreshNewtork,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Network',
                      style: TextStyle(
                        fontSize: 32.0,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF0C1E38),
                      ),
                    ),
                  ],
                ),
                Text(
                  'Encuentra a otros desarrolladores o companias ',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                CustomTextFormField(
                  controller: searchController,
                  validator: validator,
                  hintText: "Search by name",
                  icon: Icons.search,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.developers.length,
                    itemBuilder: (_, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DeveloperProfileView(
                                    user: widget.user,
                                    developer: widget.developers[index],
                                  )));
                        },
                        child:
                            DeveloperCard(developer: widget.developers[index]),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
