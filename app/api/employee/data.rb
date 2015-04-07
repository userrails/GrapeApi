module Employee
  class Data < Grape::API
    resource :employee_data do 
      desc "list of the employee data"

      get do 
        EmpData.all
      end
      #curl http://localhost:3000/api/v1/employee_data.json




      desc "create a new employee data"
      ## This takes care of parameter validation
      params do 
        requires :name, type: String
        requires :address, type: String
        requires :age, type: Integer
      end

      ## This takes care of creating employee
      post do 
        EmpData.create!({
          name: params[:name],
          address: params[:address],
          age: params[:age]
          })
      end
      #curl http://localhost:3000/api/v1/employee_data.json -d "name=jay;address=delhi;age=25"




      ## delete an employee
      params do 
        requires :id, type: String
      end

      delete ':id' do 
        EmpData.find(params[:id]).destroy!
      end
     # curl -X DELETE http://localhost:3000/api/v1/employee_data/5.json




      ## update the employee records
      params do 
        requires :id, type:String
        requires :name, type:String
        requires :address, type:String
        requires :age, type:Integer
      end

      put ':id' do 
        EmpData.find(params[:id]).update!({
          address: params[:address],
          name: params[:name],
          age: params[:age]
          })
      end

    end
  end
end