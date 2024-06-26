
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget{
  const ChangePassword({super.key});
  
  @override
  State<ChangePassword> createState() => _ChangePasswordState(); 
}

class _ChangePasswordState extends State<ChangePassword> {

  final _formKey = GlobalKey<FormState>();
  

  final controller = TextEditingController(); 
  final confirmController = TextEditingController(); 
  final newController = TextEditingController(); 
  
  bool _isSecurePassword = true;
  bool _isSecurePassword2 = true;
  bool _isSecurePassword3 = true;

  @override
  Widget build(BuildContext context){

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 74, 140, 215),
            Color.fromARGB(255, 217, 222, 222)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          
          title:const Text("Change Password"),
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 74, 140, 215),
                      Color.fromARGB(255, 217, 222, 222)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                ),
              ),
           
              ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
                key: _formKey,
                child: Column(
                  children:[

                    const SizedBox(height: 20,)
,
                      TextFormField(
                            controller: controller,
                            obscureText: _isSecurePassword,
                            validator: (String? value){
                              return value!.length < 8 ? 'Write at least 8 characters' : null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13.0),
                              ),
                        
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13.0),
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 73, 45, 83),
                                ),
                              ),

                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13.0),
                                borderSide: const BorderSide(color: Color.fromARGB(255, 73, 83, 142)),
                              ),

                              fillColor: Color.fromARGB(207, 247, 255, 247),
                              labelText: "Current Password",
                              labelStyle: TextStyle(
                                color: Color.fromARGB(255, 75, 71, 71),
                              ),

                              hintText: "Must be at least 8 characters",
                              suffixIcon: IconButton(
                                icon: Icon(_isSecurePassword ? Icons.visibility_off : Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    _isSecurePassword = !_isSecurePassword; // toggle state
                                  });
                                },
                              ),
                            ),
                    ),
  
                      const SizedBox(height: 20),
                      
                    TextFormField(
                            controller: newController,
                            obscureText: _isSecurePassword2,
                            validator: (String? value){
                                if(newController.text != confirmController.text){
                                  return "Your password is not confirm.";
                                }else{
                                  return null;
                                }
                            },
                            decoration: InputDecoration( 
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13.0),
                              ),
                        
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13.0),
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 73, 45, 83),
                                ),
                              ),

                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13.0),
                                borderSide: const BorderSide(color: Color.fromARGB(255, 73, 83, 142)),
                              ),

                                fillColor: const Color.fromARGB(207, 238, 249, 244),
                                labelText: "New Password",
                                labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 75, 71, 71),
                                ),
                                hintText: "Must be at least 8 characters",
                                suffixIcon: IconButton(
                                  icon: Icon(_isSecurePassword2 ? Icons.visibility_off : Icons.visibility),
                                  onPressed: () {
                                    setState(() {
                                      _isSecurePassword2 = !_isSecurePassword2; // toggle state
                                    });
                                  },
                                ),
                            ),
                    ),

                    const SizedBox(height: 20),

                    TextFormField(
                            controller: confirmController,
                            obscureText: _isSecurePassword3,
                            validator: (String? value){
                                if(newController.text != confirmController.text){
                                  return "Verify Password is incorrect";
                                }else{
                                  return null;
                                }
                            },

                            decoration: InputDecoration( 

                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(13.0),
                                  ),
                          
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(13.0),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 73, 45, 83),
                                    ),
                                  ),

                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(13.0),
                                    borderSide: const BorderSide(color: Color.fromARGB(255, 73, 83, 142)),
                                  ),

                                  fillColor: const Color.fromARGB(207, 238, 249, 244),
                                  labelText: "Confirm Password",
                                  labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 69, 67, 67),
                                  ),
                                  hintText: "Verify Password",
                                  suffixIcon: IconButton(
                                    icon: Icon(_isSecurePassword3 ? Icons.visibility_off : Icons.visibility),
                                    onPressed: () {
                                      setState(() {
                                        _isSecurePassword3 = !_isSecurePassword3; // toggle state
                                      });
                                    },
                                  ),
                            ),
                    ),

                    const SizedBox(height: 10),

                    SizedBox(
                      width: 200,
                      child: ElevatedButton(  
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigoAccent,    
                          ),
                          onPressed: (){
                            if(_formKey.currentState!.validate()){
                              print ("Success");
                            };
                          },
                          child: const Text("Submit",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                      ),
                    )
                  ],
                ),
              ),
          ),
        ),
      ),
    );
  }
}