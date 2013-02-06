using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.IO;
using System.Drawing;

/// <summary>
/// Summary description for Tools
/// </summary>
public class Tools
{
    public Tools()
    {
    }

    public void DeleteFilePicture(int FlatID)
    {
        string FolderPath = HttpContext.Current.Request.PhysicalApplicationPath + "Images\\Flats\\";

        RealStateDSTableAdapters.FlatsTableAdapter adapter = new RealStateDSTableAdapters.FlatsTableAdapter();

        string PictureURL = adapter.GetPictureByFlatID(FlatID);
        ProcessDelete(FolderPath );
        ProcessDelete(FolderPath + "thumb_" + PictureURL);

        RealStateDS.FlatsDataTable T = adapter.GetPicturesByFlatID(FlatID);
        for (int i = 0; i < T.Rows.Count; i++)
        {
            ProcessDelete(FolderPath + T.Rows[i].ItemArray[7].ToString());
            ProcessDelete(FolderPath + "thumb_" + T.Rows[i].ItemArray[7].ToString());
        }
    }

    protected void ProcessDelete(string FilePath)
    {
        FileInfo File = new FileInfo(FilePath);
        if (File.Exists)
        {
            File.Delete();
        }
    }

    public void DeleteFile(string FileName)
    {
        string FolderPath = HttpContext.Current.Request.PhysicalApplicationPath + "Images\\Flats\\";
        string FilePath = FolderPath + FileName;
        FileInfo File = new FileInfo(FilePath);
        if (File.Exists)
        {
            File.Delete();
        }
    }

    public bool adaptPicture(string fileName)
    {
        try
        {
            string sourceFolderName = "Images/Flats/";
            string targetFolderName = "Images/Flats/";
            String sourceFilePath = Path.Combine(HttpContext.Current.Request.PhysicalApplicationPath, (sourceFolderName+fileName));
            System.Drawing.Image source = System.Drawing.Image.FromFile(sourceFilePath);
            System.Drawing.Image.GetThumbnailImageAbort callback = new System.Drawing.Image.GetThumbnailImageAbort(ThumbnailCallback);
            System.Drawing.Image target = source.GetThumbnailImage(50, 50, callback, IntPtr.Zero);
            String targetFileName = handleName(fileName);
            String targetFilePath = Path.Combine(HttpContext.Current.Request.PhysicalApplicationPath, (targetFolderName+targetFileName));
            target.Save(targetFilePath);
        }
        catch
        {
            return false;
        }
        return true;
    }

    private Boolean ThumbnailCallback()
    {
        return false;
    }

    private String handleName(string fileName)
    {
        fileName = fileName.Insert(0,"thumb_");
        return fileName;
    }
}
