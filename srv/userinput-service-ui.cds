//Myservice is the service name and not folder in srv. It is the name u have given to service which is present in srv file of srv folder
using MyService1 from './userinput-service';

//annotate each entity
annotate MyService1.Userdet with {
   perno @title : 'ID';
   name  @title: 'First Name';
    surname @title : 'Surname / Family Name';
    }

annotate MyService1.Userdet with @(
    UI: {
         HeaderInfo: {   //for object page details
            TypeName: 'Userdet',
            TypeNamePlural: 'Userdets',
            Title          : {
                $Type : 'UI.DataField',
                Value : name
            },
            Description : {
                $Type: 'UI.DataField',
                Value: surname
            }
        },

      SelectionFields: [perno],   //for field to appear in filter in list report page
        LineItem: [
            {Value: perno},
  //           Criticality: criticality},
            {Value: name},
            {Value: surname}
        ],
         Facets: [                 // for Facets on object page
            {$Type: 'UI.ReferenceFacet', Label: 'Business Partner Details', Target: '@UI.FieldGroup#Main'},
            {$Type: 'UI.ReferenceFacet', Label: 'Office Details', Target: '@UI.FieldGroup#Office'}
        ],
        FieldGroup#Main: {
            Data: [
                {
                    Value: name,
                //    Criticality: criticality
                },
                {
                    Value: surname,
                   // Criticality: criticality
                }
            ]
        },
        FieldGroup#Office: {
            Data: [
                {Value: perno},
            ]
        },
    });