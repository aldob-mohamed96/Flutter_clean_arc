
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../resources/export_file.dart';

abstract interface class ImagePickering{
  Future<Either<Failure,File>> pickImageGallery();
  Future<Either<Failure,File>> pickImageCamera();
  Future<void> checkPermissionGalleryWithLifeCycleStateApp(AppLifecycleState state);
  Future<void> checkPermissionCameraWithLifeCycleStateApp(AppLifecycleState state);



  }

final class ImagePickerImpl implements ImagePickering{
  late bool _isDetected;
  late DataSourcePermission _dataSourcePermission;
  final PermissionHandling _permissionHandling;
  ImagePickerImpl(this._permissionHandling);
  @override
  Future<Either<Failure,File>> pickImageCamera() async{
       _dataSourcePermission = await _permissionHandling.checkPermission(Permission.camera);
       if (_dataSourcePermission ==  DataSourcePermission.allow)
       {
         try
         {
           final result=await _getImageFromCamera();
           if(result is File)
           {
             return Right(result);
           }
           else
           {
             return Left(DataSourcePermission.noImageSelected.getFailure());
           }

         }
         catch(error)
         {
           return Left(PermissionException.handlePermissionError(error).failure);
         }

       }
       else
       {

         return Left(PermissionException.handlePermissionError(_dataSourcePermission).failure);
       }

  }
  @override
  Future<Either<Failure,File>> pickImageGallery() async{
      Permission permission=Platform.isIOS?Permission.photos:Permission.storage;
       _dataSourcePermission = await _permissionHandling.checkPermission(permission);

            if (_dataSourcePermission ==  DataSourcePermission.allow)
            {
               try
               {
                 final result=await _getImageFromGallery();
                 if(result is File)
                   {
                     return Right(result);
                   }
                 else
                   {
                     return Left(DataSourcePermission.noImageSelected.getFailure());
                   }

               }
               catch(error)
               {
                 return Left(PermissionException.handlePermissionError(error).failure);
               }

            }
            else
            {

               return Left(PermissionException.handlePermissionError(_dataSourcePermission).failure);
            }

    }

  Future<File?> _getImageFromCamera() async {

    XFile? pickedFile = await ImagePicker().pickImage(
      source:  ImageSource.camera,
      maxWidth: AppConstants.maxWidthImgPickerCamera,
      maxHeight: AppConstants.maxHeightImgPickerCamera,
      imageQuality:  AppConstants.qualityImgPickerCamera,
    );
    return File(pickedFile!.path) ;



  }
  Future<File?> _getImageFromGallery() async {

    XFile? pickedFile = await ImagePicker().pickImage(
      source:ImageSource.gallery,
      maxWidth: AppConstants.maxWidthImgPickerGallery,
      maxHeight: AppConstants.maxHeightImgPickerGallery,
    //  imageQuality: AppConstants.qualityImgPickerGallery,
    );
    return File(pickedFile!.path);


  }
  @override
  Future<void> checkPermissionGalleryWithLifeCycleStateApp(AppLifecycleState state) async{

    if(AppLifecycleState.resumed==state&&_isDetected&&_dataSourcePermission==DataSourcePermission.permissionPermanentlyDenied)
    {
      _isDetected=false;
      await pickImageGallery();
    }
    if(AppLifecycleState.paused==state&&_dataSourcePermission==DataSourcePermission.permissionPermanentlyDenied)
    {
      _isDetected=true;
    }
  }
  @override
  Future<void> checkPermissionCameraWithLifeCycleStateApp(AppLifecycleState state) async{

    if(AppLifecycleState.resumed==state&&_isDetected&&_dataSourcePermission==DataSourcePermission.permissionPermanentlyDenied)
    {
      _isDetected=false;
      await pickImageCamera();
    }
    if(AppLifecycleState.paused==state&&_dataSourcePermission==DataSourcePermission.permissionPermanentlyDenied)
    {
      _isDetected=true;
    }
  }



}





