<%-- 
    Document   : admin_manageCar
    Created on : Dec 13, 2015, 10:24:37 PM
    Author     : zeeZiha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<?php
session_start();

$valid_session = isset($_SESSION['level']) ? $_SESSION['level'] == "0" : FALSE;

if($valid_session){ ?>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <jsp:include page="all_include.html"/>
    </head>

    <body>

    <jsp:include page="header.jsp"/>

    <div class="container">

        <div class="row">
            <div class="box">
                <div class="col-lg-12">
                    <hr>
                    <h2 class="intro-text text-center">
                        <strong>Manage Car</strong>
                    </h2>
                    <hr>

                    <?php
                    include "db_connect.php";

                    $sql = "select * from car";
                    $result = $conn->query($sql);

                    ?>
                    <div align="center">
                      <button class="btn btn-link" data-toggle="modal" data-target="#addCar_modal">Add Car</button>
                    </div>
                    <div class="table-responsive">
                        <table class="table">
                            <tr>
                                <th>Code</th>
                                <th>Model</th>
                                <th>Reg No</th>
                                <th>Rate per hour (RM)</th>
                                <th>image</th>
                                <th>Action</th>
                            </tr>
                            <?php
                            if ($result->num_rows > 0) {
                                while ($row = $result->fetch_assoc()) {
                                    ?>
                                    <tr>
                                        <td><?php echo $row["code"] ?></td>
                                        <td><?php echo $row["model"] ?></td>
                                        <td><?php echo $row["reg_no"] ?></td>
                                        <td><?php echo $row["rate"] ?></td>
                                        <td>
                                            <img src="<?php echo $row['image_path'] ?>" height="70" width="100">
                                        </td>
                                        <td>
                                            <button class="btn btn-primary" data-toggle="modal" data-target="#editCar_modal">Edit</button>

                                            <?php $id = $row["id"]; ?>
                                            <a class="btn btn-danger" href="admin_deleteCar.php?id=<?php echo $id ?>">Delete</a>
                                        </td>
                                    </tr>

                                    <?php
                                }
                            }
                            ?>
                        </table>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <jsp:include page="footer.jsp"/>
    </body>

    </html>
    <?php
    $conn->close();
}
else{
    echo "<div align='center'><h1 style='color:red'>You Have No Permission To Enter This Page</h1></div>";
    header('Refresh: 2; URL=index.php');
    exit();
}
?>

<div id="addCar_modal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Add Car</h4>
            </div>
            <div class="modal-body">
                <form action="admin_addCar.php" method="post" enctype="multipart/form-data">
                    <table class="table">
                        <tr>
                            <td><strong>Code</strong></td>
                            <td>
                                <input type="text" name="code" class="form-control"/>
                            </td>
                        </tr>
                        <tr>
                            <td><strong>Model</strong></td>
                            <td>
                                <input type="text" name="model" class="form-control"/>
                            </td>
                        </tr>
                        <tr>
                            <td><strong>Reg No</strong></td>
                            <td>
                                <input type="text" name="reg_no" class="form-control"/>
                            </td>
                        </tr>
                        <tr>
                            <td><strong>Rate per hour (RM)</strong></td>
                            <td>
                                <input type="text" name="rate" class="form-control"/>
                            </td>
                        </tr>
                        <tr>
                            <td><strong>Image</strong></td>
                            <td>
                                <input type="file" name="image"/>
                            </td>
                        </tr>
                    </table>
                    <div align="center">
                        <button type="submit" class="btn btn-success">Save</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<div id="editCar_modal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Edit Car Info</h4>
            </div>
            
            <div class="modal-body">
                <form action="admin_editCar.php" method="post">
                    <table class="table">
                        <tr>
                            <td><strong>Code</strong></td>
                            <td>
                                <input type="text" name="code" class="form-control" value="<?php echo $row["code"] ?>"/>
                            </td>
                        </tr>
                        <tr>
                            <td><strong>Model</strong></td>
                            <td>
                                <input type="text" name="model" class="form-control" value="<?php echo $row["model"] ?>"/>
                            </td>
                        </tr>
                        <tr>
                            <td><strong>Reg No</strong></td>
                            <td>
                                <input type="text" name="reg_no" class="form-control" value="<?php echo $row["regNo"] ?>"/>
                            </td>
                        </tr>
                        <tr>
                            <td><strong>Rate</strong></td>
                            <td>
                                <input type="text" name="rate" class="form-control" value="<?php echo $row["rate"] ?>"/>
                            </td>
                        </tr>
                        <tr>
                            <td><strong>Image</strong></td>
                            <td>
                               <input type="file" name="image"/><img src="<?php echo $row['image_path'] ?>" height="70" width="100">
                            </td>
                        </tr>
                    </table>
                    <div align="center">
                        <button type="submit" class="btn btn-success">Save</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


