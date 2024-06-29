void main(){

  Map student = {
    // Key : Values
    // String : Desire Data
    "name" : "Raheel",
    "age" : 24,
    "gender" : "Male",
    "isPresent" : true,
    "CGPA" : 3.56
  };


  List lab206 = [
    {
      "name" : "Raheel",
      "age" : 24,
      "gender" : "Male",
      "isPresent" :  [
  {
  "day" : "Tuesday",
  "isPresent" : true
  },
  {
  "day" : "Thursday",
  "isPresent" : false
  },
  {
  "day" : "Saturday",
  "isPresent" : true
  }
  ],
      "CGPA" : 3.56
    },
    {
      "name" : "Abdul Rehman",
      "age" : 28,
      "gender" : "Male",
      "isPresent" :  [
    {
    "day" : "Tuesday",
    "isPresent" : true
    },
    {
    "day" : "Thursday",
    "isPresent" : false
    },
    {
    "day" : "Saturday",
    "isPresent" : true
    }
    ],
      "CGPA" : 3.58
    },
    {
      "name" : "Azeem",
      "age" : 20,
      "gender" : "Male",
      "isPresent" : [
        {
          "day" : "Tuesday",
          "isPresent" : true
        },
        {
          "day" : "Thursday",
          "isPresent" : false
        },
        {
          "day" : "Saturday",
          "isPresent" : true
        }
      ],
      "CGPA" : 2.50
    }


  ];

  print(lab206[2]["isPresent"][0]["day"]);

}