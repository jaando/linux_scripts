using System;
using System.IO;

namespace jaando_pdf
{
	class MainClass
	{
		public static void Main (string[] args)
		{
			string monitoringPath = args [0];
			string destinationPath = args [1];
			string user = args [2];
			string group = args [3];

			DirectoryInfo monitoringPathInfo = new DirectoryInfo (monitoringPath);
			DirectoryInfo destinationPathInfo = new DirectoryInfo (destinationPath);

			foreach(
		}
	}
}
