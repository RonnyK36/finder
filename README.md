# finder

Kelvin Rono - BTCES/2018/85442
My final year project

A flutter app to help students find a place to stay, ie hostel, rental etc.

Project begins pn 20th Oct 2021.

<!-- Documentation -->

ALL SCREENSHOTS RELATED ARE IN THE SCREENSHOTS FOLDER AT THE ROOT DIRECTORY

<!-- INTRODUTION. -->

Finder application is a platform for users, majorly targeting students to connect with property owners online. This works where a property owner posts any vacancy in his or her own apartments, and they will be available for viewing by users (tenants). This will help reduce to burden of walking around trying to find a vacancy, which may lead to frustration. The only available means online currently is the Mount Kenya University system for hostels within the school. This gives parents the opportunity to book a room for their children.

 <!-- OBJECTIVES -->

The objectives of this project includes:

1. Design a system that allows users to create accounts.
2. Design a system that allows property owners to post an apartment.
3. Design a system that allows property owners to update and delete an apartment.
4. Design a system where tenants can view all posts from property owners.
5. Design a system where tenants can call and view property owners’ details.

<!-- SYSTEM DESIGN -->

Some of the conditions I had to consider before deciding on the method to use in the development:
• Does the method support both of the largest platforms (Android devices and iOS).
• The amount of available support for the method in case I got stack.
• How proficient am I in the selected method
• How fast will I deliver a Minimum Viable Product (MVP)

<!-- What is Flutter? -->

Flutter is an open-source UI software development kit created by Google.

<!-- Tools I used for development. -->

• Android Studio
• Flutter SDK
• Java JDK
• Visual Studio Code (Alternative for Android Studio)
• Dart and Flutter Plugins
• Git - Version control tool

 <!-- SYSTEM IMPLEMENTATION AND TESING -->

The core features include:

1. Ability to create an account as either a property owner or tenant.
2. Ability to login to an account.
3. Ability to post apartments for the property owner.
4. Ability to update and delete apartments.
5. Ability to view available properties for the tenants.
6. Ability to call a property owner for the tenants
   Supporting features at times help to integrate two or mere features together. For example when I had to let the user navigate to Create account page from the login page if they have no account.

<!-- ADDING CORE FEATURES.	 -->

HERE ARE THE SCREENS IN THE APPLICATION

1 Landing Screen (Splash Screen)
This screen worked as the wrapper. As the user launches the application, this page opens to then. In the background, the app checks whether the user was already logged in or not. If not, then the user is redirected to the login screen where they.

2 Create Account Screen
This screen will allow a user to create an account if they have now. The screen has text input fields that allows the user to give basic details. The details collected from a form in this page collects and uses it to create a user document in firestore saving all details. The details include:
• User mode, i.e. tenant or property owner
• Username
• Email address
• Password

Upon submitting the details by clicking on “Sign up”, there is a functionality to redirect the user to a page where they provide their phone number as additional information.
At the bottom of the screen, I added a button that allows a user to navigate to the login screen in the case where they already have an account.

3 Login Screen
In the case where a user already had an account, they will need to login. This screen only requires the user to provide their credentials, that is, email and password. When a user clicks on the “Login” button, the function to login in a user fires, and if the credentials are valid, depending on where a user is a landlord or a tenant, they are shown a different screen accordingly.

4 Post apartments Screen (Landlords)
When a property owner logs in successfully, they are shown this screen. This gives him/her the functionality to create a new apartment vacancy. This will be shown to tenants who also login in.
In order to create an apartment and make all apartments created have similar forms in the database, I created an apartment model, which exclusively defines what details are required.

These details are used to create an apartment online and are linked to the owner using the owner ID generated when a property owner is created.

5 Update and Delete apartments (Landlords)
5.1 Update
In this screen, the property owner will have the ability to update apartment details for example price and deposit. They can also delete an apartment for various reasons, for example if it is no longer available.
This screen will display all apartments that a property owner has posted and two buttons “Update” and “Delete”.

On clicking the update button, the app navigates to a screen where all detail about the apartment are pre-filled into text fields giving them the ability to edit them. After editing desired fields, in order to submit, click “Updates”.

5.2 Delete
When deleting an apartment, a dialog box is show for them to confirm this action. If they confirm, they are redirected to the previous screen and the record is removed from the database.

6 View available apartments Screen (Tenants)
This is what a tenant views if the authentication was successful. As soon as this page is created, it will make a request to the real-time firebase firestore and fetches all available apartments. A user can go through available rooms, make a selection. They can also view more details by clicking on an apartment card. This navigates them to a View details screen.

7 Profile Screen
There is an inevitable need to display a user’s information. In addition, at times a tenant may want to view details of a landlord. This creates a need to have a dynamic profile screen. When a user views their profile, only their details are shown. However, when a tenant views a property owner’s profile, the details will be shown, and in addition, buttons to call them and another to view the apartments they have posted.

<!-- Firestore Details and Structure -->

A database is an organized collection of structured information, or data, typically stored electronically in a computer system. In this case, the best type of database to use was a NoSQL database. NoSQL databases are non-tabular databases and store data differently than relational tables.
The database uses key value pairs to store information. Using models help to maintain all similar entities consistent and similar.
An example of data stored in form of a table is shown below:

<!-- Landlords table -->

Landlords
LandlordID DisplayName Phone Email Usermode Timestamps
1 John Smith 0727447786 john@gmail.com Landlord 28/11/2021
2 Jane Doe 0712345678 jane@gmail.com Landlord 26/11/2021

<!-- Tenants table -->

Tenants
TenantID DisplayName Phone Email Usermode Timestamps
1 Kelvin Rono 0721345678 kelvin@gmail.com Tenant 22/11/2021
2 Lexie Jr 0724354657 lexie@gmail.com Tenant 25/11/2021

 <!-- Apartments table -->

Apartments
ApartmentID LandlordID Name Deposit Price Description Owner
Apartment_1 2 Academic 500 5500 Hostel Jane Doe
Apartment_2 1 Haven House 18000 7000 Bedsitter John Smith

<!-- ADDING EXTRA FEATURES -->

During the development stage, I reused some functions and widgets. Code refactoring became an important step in ensuring reusability. An example of codes I reused include, input text form fields, buttons and configuration settings. Separating them into different files all gave me ability to import them later in other files.
In order to reuse a widget, I passed in required parameters. The parameters vary depending on the use and the type of widget. In order for a widget to be more customizable, I added more required parameter.
Refactoring and reusing codes have more than one advantage. Some of these advantages include:
• Saves on time since some components are created from “templates”.
• Ensures the app is uniform since configurations are similar.
• Easy to deploy across more devices while maintaining the same look and feel.
• Offers a clean UI for great UX.

 <!-- Recommendations -->

However the application met all objectives, and given that there is no much work done on a similar application, this application has a lot of areas to be improved. Working on this project was propelled toward coming up with a minimum viable product. This can work as a base for further improvements. Examples of such improvements include:
• Adding the ability for a property owner to track their property so that the app can automatically show tenants when there is a vacancy. This can especially be successful when working with hostels.
• Another possible area is adding more features to add reviews to apartments and hostels in order for tenants to weigh and pick.
• It is also possible to add filtering functionality; this will allow users to pick desired apartments to be displayed, for example basing on location or property owner.
• Someone might focus on the area where property owners are validated to increase security.

<!-- REFERENCE -->

Wu, W. (2018). React Native vs Flutter, Cross-platforms mobile application frameworks.
Truica, C. O., Radulescu, F., Boicea, A., & Bucur, I. (2015, May). Performance evaluation for CRUD operations in asynchronously replicated document oriented database. In 2015 20th International Conference on Control Systems and Computer Science (pp. 191-196). IEEE.
Connoly, T., Begg, C., & Strachan, A. (2002). Database systems. System, 4(5), 6.
Kausar, M. A., & Nasar, M. (2021). SQL versus NoSQL databases to assess their appropriateness for big data application. Recent Advances in Computer Science and Communications (Formerly, Recent Patents on Computer Science), 14(4), 1098-1108.
Kuzmin, N., Ignatiev, K., & Grafov, D. (2020). Experience of Developing a Mobile Application Using Flutter. In Information Science and Applications (pp. 571-575). Springer, Singapore.
Moroney, L. (2017). The firebase realtime database. In The Definitive Guide to Firebase (pp. 51-71). Apress, Berkeley, CA.
Somasundaram, R. (2013). Git: Version Control for Everyone Beginner's Guide. Packt Pub..
