import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend_recruitech_flutter_v2/profile/data/remote/models/developer.dart';
import 'package:frontend_recruitech_flutter_v2/profile/data/remote/services/profile_service.dart';
import 'package:frontend_recruitech_flutter_v2/profile/ui/developer_profile/widgets/about_dialog.dart';
import 'package:frontend_recruitech_flutter_v2/profile/ui/developer_profile/widgets/background_picture_dialog.dart';
import 'package:frontend_recruitech_flutter_v2/profile/ui/developer_profile/widgets/education_card.dart';
import 'package:frontend_recruitech_flutter_v2/profile/ui/developer_profile/widgets/experience_card.dart';
import 'package:frontend_recruitech_flutter_v2/profile/ui/developer_profile/widgets/profile_picture_dialog.dart';

import '../../../shared/ui/theme/text_styles.dart';

class DeveloperProfileView extends StatefulWidget {
  const DeveloperProfileView({super.key, required this.developer});

  final Developer developer;

  @override
  State<DeveloperProfileView> createState() => _DeveloperProfileViewState();
}

class _DeveloperProfileViewState extends State<DeveloperProfileView>
    with SingleTickerProviderStateMixin {
  bool isMyProfile = false;
  TabController? _tabController;
  ProfileService? profileService;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    profileService = ProfileService();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Profile",
          style: CustomTextStyle.titleMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height * 1.25,
          color: Colors.grey.shade300,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                child: Container(
                  width: double.infinity,
                  height: size.height * 0.25,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        widget.developer.backgroundPicture,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: size.height * 0.18,
                child: Container(
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0)),
                  padding: const EdgeInsets.only(
                    top: 64.0,
                    bottom: 16.0,
                    right: 16.0,
                    left: 16.0,
                  ),
                  child: Column(
                    children: [
                      Text(
                        '${widget.developer.firstName} ${widget.developer.lastName}',
                        style: CustomTextStyle.titleSmall,
                      ),
                      const Text(
                        'Flutter Developer',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Color(
                              0xFF898989,
                            ),
                            size: 15.0,
                          ),
                          const SizedBox(
                            width: 4.0,
                          ),
                          Text(
                            widget.developer.location,
                            style: const TextStyle(
                              fontFamily: 'Gilroy',
                              fontWeight: FontWeight.w500,
                              color: Color(
                                0xFF898989,
                              ),
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 18.0,
                      ),
                      Visibility(
                        visible: !isMyProfile,
                        child: SizedBox(
                          width: size.width * 0.6,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: size.width * 0.29,
                                child: OutlinedButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide.none,
                                    backgroundColor: const Color(0xFF2F4897),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 14.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  child: const Text(
                                    'Connect',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.29,
                                child: OutlinedButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(color: Color(0xFF2F4897)),
                                    backgroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 14.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  child: const Text(
                                    'Message',
                                    style: TextStyle(color: Color(0xFF2F4897)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: isMyProfile,
                child: Positioned(
                  right: 12,
                  top: 12,
                  child: Container(
                    height: 36.0,
                    width: 36.0,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(36.0)),
                    child: IconButton(
                      iconSize: 20,
                      onPressed: () async {
                        String? res = await showDialog(
                          context: context,
                          builder: (context) {
                            return BackgroundPictureDialog(
                              developer: widget.developer,
                            );
                          },
                        );

                        if (res != null) {
                          await profileService?.updateBackgroundPicture(
                              widget.developer.id, res);
                          setState(() {
                            widget.developer.backgroundPicture = res;
                          });
                        }
                      },
                      icon: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: size.height * 0.09,
                child: CircleAvatar(
                  radius: 68,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      widget.developer.profilePicture,
                    ),
                    backgroundColor: Colors.black,
                    radius: 64.0,
                  ),
                ),
              ),
              Visibility(
                visible: isMyProfile,
                child: Positioned(
                  left: size.width * 0.1,
                  top: size.height * 0.19,
                  child: Container(
                    height: 34.0,
                    width: 34.0,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(36.0)),
                    child: IconButton(
                      iconSize: 18,
                      onPressed: () async {
                        String? res = await showDialog(
                          context: context,
                          builder: (context) {
                            return ProfilePictureDialog(
                              developer: widget.developer,
                            );
                          },
                        );
                        if (res != null) {
                          await profileService?.updateProfilePicture(
                              widget.developer.id, res);
                          setState(() {
                            widget.developer.profilePicture = res;
                          });
                        }
                      },
                      icon: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: isMyProfile,
                child: Positioned(
                  right: size.width * 0.1,
                  top: size.height * 0.19,
                  child: Container(
                    height: 34.0,
                    width: 34.0,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(36.0)),
                    child: IconButton(
                      iconSize: 18,
                      onPressed: () async {
                        String? res = await showDialog(
                          context: context,
                          builder: (context) {
                            return ProfilePictureDialog(
                              developer: widget.developer,
                            );
                          },
                        );
                        if (res != null) {
                          await profileService?.updateProfilePicture(
                              widget.developer.id, res);
                          setState(() {
                            widget.developer.profilePicture = res;
                          });
                        }
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: isMyProfile ? size.height * 0.4 : size.height * 0.465,
                child: Container(
                  color: Colors.white,
                  width: size.width,
                  height:
                      isMyProfile ? size.height * 0.85 : size.height * 0.785,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(
                            height: 16.0,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.0),
                            child: Text(
                              'About',
                              style: TextStyle(
                                fontFamily: 'Gilroy',
                                color: Color(0xFF0C1E38),
                                fontWeight: FontWeight.w700,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 24.0),
                            child: Text(
                              widget.developer.about.isEmpty
                                  ? "Write about you!"
                                  : widget.developer.about,
                              style: const TextStyle(
                                fontFamily: 'Gilroy',
                                color: Color(0xFF0C1E38),
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      TabBar(
                        isScrollable: true,
                        controller: _tabController,
                        indicatorSize: TabBarIndicatorSize.tab,
                        tabs: [
                          SizedBox(
                            width: size.width * 0.38,
                            child: Tab(
                              text: "Experience",
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.38,
                            child: Tab(
                              text: "Education",
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            ListView.builder(
                              itemCount: widget.developer.experiences.length,
                              itemBuilder: (_, index) {
                                return ExperienceCard(
                                  experience:
                                      widget.developer.experiences[index],
                                );
                              },
                            ),
                            ListView.builder(
                              itemCount: widget.developer.educations.length,
                              itemBuilder: (_, index) {
                                return EducationCard(
                                  education: widget.developer.educations[index],
                                );
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: isMyProfile,
                child: Positioned(
                  right: size.width * 0.05,
                  top: size.height * 0.44,
                  child: IconButton(
                    iconSize: 24,
                    onPressed: () async {
                      String? res = await showDialog(
                        context: context,
                        builder: (context) {
                          return AboutDataDialog(
                            developer: widget.developer,
                          );
                        },
                      );
                      if (res != null) {
                        await profileService?.updateAboutData(
                            widget.developer.id, res);
                        setState(() {
                          widget.developer.about = res;
                        });
                      }
                    },
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
