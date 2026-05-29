import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'My Portfolio',
      debugShowCheckedModeBanner: false,
      home: PortfolioMainPage(),
    );
  }
}

// PERSONAL PAGE
class PersonalPage extends StatelessWidget {
  const PersonalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9ECF4),
      appBar: AppBar(
        title: const Text("Personal Page"),
        backgroundColor: const Color(0xFFF1BCC6),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Center( 
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, 
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFF1BCC6)),
                  child: const Text("Back"),
                ),
              ),
              const SizedBox(height: 20),
              LayoutBuilder(
                builder: (context, constraints) {
                  double cardWidth = constraints.maxWidth > 800 ? (constraints.maxWidth * 0.49) : (constraints.maxWidth * 0.95);
      
                  return Wrap(
                    alignment: WrapAlignment.center, 
                    spacing: 10,
                    runSpacing: 20,
                    children: [
                      _buildPersonalCard(
                        imagePath: 'assets/galderma.png',
                        description: "I was the Project Manager in our Capstone 1 course. I managed the project documentation, including detailed project overviews and functional definitions, to guide my team for the development and scope of our capstone project.",
                        width: cardWidth,
                      ),
                      _buildPersonalCard(
                        imagePath: 'assets/extra.png',
                        description: "I was the 3rd-year IT Representative for Intellitech during our Academic week. One of my main responsibilities was to manage how students moved through the event. I spent time in handling how we could maximize the space, and ensuring that we could accommodate more students comfortably.",
                        width: cardWidth,
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPersonalCard({required String imagePath, required String description, required double width}) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(imagePath, width: double.infinity, fit: BoxFit.cover),
          ),
          const SizedBox(height: 16),
          Text(description, textAlign: TextAlign.center, style: const TextStyle(fontSize: 14, color: Color(0xFF4A5568))),
        ],
      ),
    );
  }
}

// EMAIL SUCCESS PAGE 
class EmailSentSuccessPage extends StatelessWidget {
  const EmailSentSuccessPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9ECF4),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 100),
            const SizedBox(height: 20),
            const Text("Email Sent Successfully!", style: TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Back"),
            )
          ],
        ),
      ),
    );
  }
}

// COMPOSE EMAIL PAGE 
class ComposeEmailPage extends StatefulWidget {
  const ComposeEmailPage({super.key});

  @override
  State<ComposeEmailPage> createState() => _ComposeEmailPageState();
}

class _ComposeEmailPageState extends State<ComposeEmailPage> {
  final TextEditingController _emailController = TextEditingController(
    text: 'linobo.rheanicole29@gmail.com',
  );
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _sendEmailViaApp() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.pinkAccent),
        ),
      ),
    );

    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    Navigator.pop(context);
    
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green),
            SizedBox(width: 10),
            Text("Success"),
          ],
        ),
        content: const Text("Email sent successfully!"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); 
              Navigator.pop(context); 
            },
            child: const Text("OK", style: TextStyle(color: Colors.pinkAccent)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9ECF4),
      appBar: AppBar(
        title: const Text("Compose Email"), 
        backgroundColor: const Color(0xFFF1BCC6),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("To:", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: const Text("linobo.rheanicole29@gmail.com"),
            ),
            
            const SizedBox(height: 24),
            const Text("Message:", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Expanded( 
              child: TextField(
                controller: _messageController, 
                maxLines: null, 
                expands: true,  
                textAlignVertical: TextAlignVertical.top,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Type your message here...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 16.0, 
              runSpacing: 10.0, 
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Back"),
                ),
                ElevatedButton(
                  onPressed: _sendEmailViaApp, 
                  child: const Text("Send Email"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// PORTFOLIO MAIN PAGE
class PortfolioMainPage extends StatefulWidget {
  const PortfolioMainPage({super.key});

  @override
  State<PortfolioMainPage> createState() => _PortfolioMainPageState();
}

class _PortfolioMainPageState extends State<PortfolioMainPage> {
  int currentSection = 0;
  
  Future<void> _launchFacebook() async {
    final Uri facebookUrl = Uri.parse('https://www.facebook.com/rherherhea.moon/'); 
    if (!await launchUrl(facebookUrl)) {
      throw Exception('Could not launch $facebookUrl');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isDesktop = screenWidth >= 1150;

    return Scaffold(
      backgroundColor: const Color(0xFFE9ECF4),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isDesktop
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Welcome, I'm Rhei!",
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFD37A8B)),
                        ),
                        buildNavigationMenu(),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Welcome, I'm Rhei!",
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFD37A8B)),
                        ),
                        const SizedBox(height: 20),
                        Center(child: buildNavigationMenu()),
                      ],
                    ),
              const SizedBox(height: 32),

              isDesktop
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 300, child: buildProfileSidebar()),
                        const SizedBox(width: 32),
                        Expanded(child: buildMainContentArea()),
                      ],
                    )
                  : Column(
                      children: [
                        buildProfileSidebar(),
                        const SizedBox(height: 32),
                        buildMainContentArea(),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNavigationMenu() {
    return FittedBox(
      fit: BoxFit.scaleDown, 
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFDDE2EE),
          borderRadius: BorderRadius.circular(14),
        ),
        padding: const EdgeInsets.all(6),
        child: Row( 
          mainAxisSize: MainAxisSize.min,
          children: [
            buildMenuButton("What I Do", 0),
            buildMenuButton("About Me", 1),
            buildMenuButton("Work Experience", 2),
            buildMenuButton("What I Further Want To Achieve", 3),
          ],
        ),
      ),
    );
  }

  Widget buildMenuButton(String label, int index) {
    bool isSelected = currentSection == index;
    return InkWell(
      onTap: () {
        setState(() {
          currentSection = index;
        });
      },
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF1BCC6) : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: isSelected ? const Color(0xFF632B35) : const Color(0xFF4A5568),
          ),
        ),
      ),
    );
  }

  Widget buildProfileSidebar() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              const SizedBox(
                width: 180,
                height: 180, 
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.asset(
                  'assets/profile.jpg', 
                  width: 155,
                  height: 155,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 155,
                    height: 155,
                    color: const Color(0xFFCBD5E0),
                    child: const Icon(Icons.person, size: 48, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            "Rhea Nicole B. Linobo",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1A202C)),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 6),
          const Text(
            "Student Developer",
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Color(0xFF718096)),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildSocialIcon(Icons.facebook, const Color(0xFF1877F2), action: _launchFacebook),
              const SizedBox(width: 12),
              buildSocialIcon(Icons.camera_alt_rounded, const Color(0xFFE1306C), action: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const PersonalPage()));
              }),
              const SizedBox(width: 12),
              buildSocialIcon(Icons.email_rounded, const Color(0xFFEA4335), action: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ComposeEmailPage()));
              }),
            ],
          ),
          const SizedBox(height: 28),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF5F7),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                buildContactItem(Icons.phone_android_rounded, "Phone", "+639058171544"),
                const Divider(color: Color(0xFFFCDCE2), height: 16),
                buildContactItem(Icons.alternate_email_rounded, "Personal Email", "linobo.rheanicole29@gmail.com", isEmailLink: true),
                const Divider(color: Color(0xFFFCDCE2), height: 16),
                buildContactItem(Icons.location_on_rounded, "Location", "Bulacan, Philippines"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSocialIcon(IconData icon, Color color, {VoidCallback? action}) {
    return InkWell(
      onTap: action,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: const Color(0xFFF7FAFC), borderRadius: BorderRadius.circular(12)),
        child: Icon(icon, size: 20, color: color),
      ),
    );
  }

  Widget buildContactItem(IconData icon, String title, String value, {bool isEmailLink = false}) {
    return InkWell(
      onTap: isEmailLink ? () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ComposeEmailPage()),
        );
      } : null,
      child: Row(
        children: [
          Icon(icon, size: 18, color: const Color(0xFFD37A8B)),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 11, color: Color(0xFFA0AEC0), fontWeight: FontWeight.bold)),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF2D3748),
                    decoration: isEmailLink ? TextDecoration.underline : TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMainContentArea() {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: getSectionBody(),
    );
  }

  Widget getSectionBody() {
    if (currentSection == 0) {
      return showWhatIDoSection();
    } else if (currentSection == 1) {
      return showAboutMeSection();
    } else if (currentSection == 2) {
      return showWorkExperienceSection();
    } else {
      return showFutureGoalsSection();
    }
  }

  Widget showWhatIDoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildSectionTitle("What I Do!"),
        const SizedBox(height: 28),
        buildServiceCard("UI/UX Designing", "I do visually compelling, user-friendly interfaces that optimize the end-user experience. My designs focus on clarity and interaction performance.", Icons.brush_rounded, const Color(0xFFFFF0F3)),
        const SizedBox(height: 16),
        buildServiceCard("App Development", "I started integrating front-end logic to build scalable cross-platform mobile applications in modern frameworks.", Icons.phone_android_rounded, const Color(0xFFF0F4FF)),
        const SizedBox(height: 16),
        buildServiceCard("HTML/CSS/Javascript", "I build a foundational web layers with proficient code which ensures responsive layouts across all modern browser modes.", Icons.code_rounded, const Color(0xFFFFF9EE)),
        const SizedBox(height: 16),
        buildServiceCard("Web Development", "I find myself most captivated by the flexibility in web development. I'm eager to dive into new projects and discover innovative ways to create fast, scalable, and user-friendly applications.", Icons.language_rounded, const Color(0xFFEBFBFA)),
      ],
    );
  }

  Widget showAboutMeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildSectionTitle("About Me"),
        const SizedBox(height: 28),
        buildInfoRow("Full Name", "Rhea Nicole Boloabio Linobo"),
        buildInfoRow("Age", "21 years old"),
        buildInfoRow("Sex", "Female"),
        buildInfoRow("Birthday", "December 29, 2004"),
        buildInfoRow("Religion", "Roman Catholic"),
        const SizedBox(height: 16),
        const Text(
          "I am thrilled and welcome you to my portfolio! My journey in web development has been exhilarating, and I constantly strive to enhance my skills. I am passionate about learning innovative techniques and keeping myself adaptable to current engineering frameworks.",
          style: TextStyle(fontSize: 15, color: Color(0xFF4A5568), height: 1.6),
        ),
      ],
    );
  }

  Widget showWorkExperienceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildSectionTitle("Work Experience"),
        const SizedBox(height: 28),
        buildExperienceItem(
          "Virtual Assistant (VA)",
          "Instabute (2022 - 2023)",
          "Managed data verification and quality control protocols. Conducted task validation architectures for the brand ambassador networks, and utilized Microsoft Excel functions as the centralized monitoring tool for tracking daily milestones of product advertisement.",
        ),
        const SizedBox(height: 24),
        buildExperienceItem(
          "Information Technology Student",
          "Academic & Personal Training Development",
          "As a student, I was dedicated to a continuous self-improvement in web architectures and responsive ecosystem designs. My academic journey prioritized user-centric methodologies to develop accessible, and engaging user-friendly experiences that align with current industry standards for UI/UX design.",
        ),
      ],
    );
  }

  Widget showFutureGoalsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildSectionTitle("What I Further Want to Achieve"),
        const SizedBox(height: 28),
        buildGoalItem("Improve Learning to Databases", "Organizing collection of data that is electronically stored and accessed by a computer system, learn more available database environments and optimized production data engines."),
        const SizedBox(height: 16),
        buildGoalItem("Deepen Advanced Cross-Platform System Design", "Optimizing data integration layer performance and management in multi-platform applications."),
        const SizedBox(height: 16),
        buildGoalItem("Contribute To Scalable Open-Source Tech Stacks", "Engaging with developer collectives to design system modules and accessible tool systems, as well as improve myself for the future technological innovation."),
      ],
    );
  }

  Widget buildSectionTitle(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xFF2D3748))),
        const SizedBox(height: 8),
        Container(width: 60, height: 4, color: const Color(0xFFD37A8B)),
      ],
    );
  }

  Widget buildServiceCard(String title, String description, IconData icon, Color background) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEDF2F7)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: background, borderRadius: BorderRadius.circular(12)),
            child: Icon(icon, color: const Color(0xFFD37A8B), size: 22),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF2D3748))),
                const SizedBox(height: 6),
                Text(description, style: const TextStyle(fontSize: 12, color: Color(0xFF718096), height: 1.45)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInfoRow(String key, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Text("$key: ", style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF4A5568), fontSize: 15)),
          Text(value, style: const TextStyle(color: Color(0xFF718096), fontSize: 15)),
        ],
      ),
    );
  }

  Widget buildExperienceItem(String position, String company, String details) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 6.0),
          child: CircleAvatar(radius: 5, backgroundColor: Color(0xFFD37A8B)),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(position, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Color(0xFF2D3748))),
              Text(company, style: const TextStyle(fontSize: 13, color: Color(0xFFD37A8B), fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              Text(details, style: const TextStyle(fontSize: 14, color: Color(0xFF718096), height: 1.55)),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildGoalItem(String heading, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.star, color: Color(0xFFD37A8B), size: 16),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(heading, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF2D3748))),
              Text(text, style: const TextStyle(fontSize: 13, color: Color(0xFF718096))),
            ],
          ),
        ),
      ],
    );
  }
}