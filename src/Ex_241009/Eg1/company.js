let objJson = {
    "companyname": {
        "companyname": "Aptech",
        "ceo": "Tung",
        "employees": {
            "employee": [
                {
                    "code": "NV001",
                    "name": "Nguyen A",
                    "address": "HN"
                },
                {
                    "code": "NV002",
                    "name": "Tran B",
                    "address": "HN"
                }
            ]
        }
    }
    }   

    let strJson = JSON.stringify(objJson);
    localStorage.setItem('company', strJson)
    console.log("strJson.companyname", strJson.companyname)
    console.log("objJson.companyname", objJson.companyname)

    let objLocalStorage = JSON.parse(localStorage.getItem('company'))
    console.log("objLocalStorage.companyname", objLocalStorage.companyname)